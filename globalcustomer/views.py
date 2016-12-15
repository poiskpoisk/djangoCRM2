import time

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
        translation.activate( settings.MY_LANG_CODE )
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

            perms_a=[]
            perms_b=[]
            perms_m=[]

            with schema_context('a1'):
                group_a = Group.objects.get(name='admin')
                perms = group_a.permissions.all()
                for perm in perms:
                    perms_a.append([perm.name,perm.codename,perm.content_type])

                group_b = Group.objects.get(name='boss')
                perms = group_b.permissions.all()
                for perm in perms:
                    perms_b.append([perm.name,perm.codename,perm.content_type])


            with schema_context(form.data['schema_name']):

                Permission.objects.all().delete()
                content_types = ContentType.objects.all()

                for perm in perms_a:
                    for ct in content_types:
                        if str(perm[2]) == str(ct):
                            perm[2] = ct

                mygroup, created = Group.objects.get_or_create(name=group_a.name)
                mygroup.permissions.clear()

                for perm in perms_a:
                    permission = Permission.objects.get_or_create(codename=perm[1], name=perm[0], content_type=perm[2])
                    mygroup.permissions.add(permission[0])

                for perm in perms_b:
                    for ct in content_types:
                        if str(perm[2]) == str(ct):
                            perm[2] = ct

                mygroup, created = Group.objects.get_or_create(name=group_b.name)
                mygroup.permissions.clear()

                for perm in perms_b:
                    permission = Permission.objects.get_or_create(codename=perm[1], name=perm[0], content_type=perm[2])
                    mygroup.permissions.add(permission[0])








                '''mygroup, created = Group.objects.get_or_create(name=group_b.name)
                for perm in perms_b:
                    mygroup.permissions.add(perm)

                mygroup, created = Group.objects.get_or_create(name=group_m.name)
                for perm in perms_m:
                    mygroup.permissions.add(perm)
                '''

                user = User.objects.create_user(username='admin', password='djangoone')
                user.is_staff = True
                user.is_superuser = True
                user.save()

            '''user = User(username='new_admin', password='djangoone')
            user.is_staff = False
            user.is_superuser = False
            try:
                group = Group.objects.get(name='admin')
            except:
                messages.error(request, _('Немогу получить доступ к группе прав АДМИНИСТРАТОР'))
                return super().post(self, request, *args, **kwargs)

            # set group permission for user which linked with salesperson
            user.groups.add(group)
            user.save()'''

            if DEBUG:
                site += ':8000'
            return HttpResponseRedirect(site)
        else:
            messages.error(request, _('Что-то пошло не так'))
            return super().post(self, request, *args, **kwargs)
