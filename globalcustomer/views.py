from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.utils import translation
from django.utils.translation import ugettext_lazy as _
from django.views.generic import CreateView
from django.contrib.auth.models import Group, User, Permission
from django.contrib.contenttypes.models import ContentType
from tenant_schemas.utils import schema_context

from globalcustomer.forms import GlobalClientForm, ChooseLangForm
from globalcustomer.models import Client
from globalcustomer.signals import ChooseLang

from simpleCRM.settings import DEBUG
from simpleCRM import settings


def choose_lang(request):
    form = ChooseLangForm()
    if request.method == 'POST':
        form = ChooseLangForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data  # now in the object cd, you have the form as a dictionary.
            lang = cd.get('Language')
            # send language choice signal
            ChooseLang.send(sender=None, lang=lang)
            return HttpResponseRedirect(reverse('globalcustomer'))

    return render(request, 'globalcustomer/choose_lang.html', {'form': form})


class GlobalClientCreateView(CreateView):
    model = Client
    form_class = GlobalClientForm
    template_name = 'globalcustomer/globalcustomer_new.html'

    def get(self, request, *args, **kwargs):
        # change active language in dependence of received signal
        translation.activate(settings.MY_LANG_CODE)
        return super().get(self, request, *args, **kwargs)

    def get_success_url(self):
        return reverse('globalcustomer')

    def post(self, request, *args, **kwargs):

        form = GlobalClientForm(request.POST)
        current_site = get_current_site(request)

        if form.is_valid():
            rec = form.save(commit=False)
            rec.domain_url = form.data['schema_name'] + '.' + current_site.domain
            rec.lang = settings.MY_LANG_CODE
            rec.save()
            site = 'http://' + form.data['schema_name'] + '.' + current_site.name

            self.create_group_and_permissions(form.data['schema_name'])
            self.create_users(form.data['schema_name'])

            if DEBUG:
                site += ':8000'
            return HttpResponseRedirect(site)
        else:
            messages.error(request, _('Что-то пошло не так'))
            return super().post(self, request, *args, **kwargs)

    def create_group_and_permissions(self, schema_name):

        all_perms=[]
        # Use a1 schema, as a source permissions and groups data
        with schema_context('a1'):
            # Go through all groups and grab permissions for each one
            groups = Group.objects.all()
            for group in groups:
                perms = group.permissions.all()
                perms_list = []
                for perm in perms:
                    perms_list.append([perm.name,perm.codename,perm.content_type])
                all_perms.append(perms_list)
        # So, we have groups - the list of group and all_perms - the list of permissions of each permission group
        with schema_context(schema_name):
            # Delete all permissions to avoid future conflicts
            Permission.objects.all().delete()
            # Grab all content types from new tenant
            content_types = ContentType.objects.all()

            for group, perms in zip(groups, all_perms):
                # Some tricky moment. Change content type from source tenant on content type new tenant
                for perm in perms:
                    for ct in content_types:
                        if str(perm[2]) == str(ct):
                            perm[2] = ct

                mygroup, created = Group.objects.get_or_create(name=group.name)
                # Delete all group permissions to avoid future conflicts
                mygroup.permissions.clear()
                # Create permissions and add it to group
                for perm in perms:
                    permission = Permission.objects.get_or_create(codename=perm[1], name=perm[0], content_type=perm[2])
                    mygroup.permissions.add(permission[0])

    def create_users(self, schema_name):

        with schema_context(schema_name):
            user = User.objects.create_user(username='admin', password='djangoone')
            user.is_staff = True
            user.is_superuser = True
            user.save()

            user = User.objects.create_user(username='new_admin', password='djangoone')
            user.is_staff = False
            user.is_superuser = False
            group = Group.objects.get(name='admin')
            # set group permission for user which linked with salesperson
            user.groups.add(group)
            user.save()
