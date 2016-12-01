from django.http import HttpResponseRedirect
from django.views.generic import CreateView
from globalcustomer.forms import GlobalClientForm
from globalcustomer.models import Client
from django.core.urlresolvers import reverse
from django.utils.translation import ugettext as _
from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from simpleCRM.settings import DEBUG


class GlobalClientCreateView(CreateView):

    model = Client
    form_class = GlobalClientForm
    template_name = 'globalcustomer/globalcustomer_new.html'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def get_success_url(self):
        return reverse('globalcustomer')

    def post(self, request, *args, **kwargs):

        form = GlobalClientForm(request.POST)
        current_site = get_current_site(request)

        if form.is_valid():
            rec = form.save(commit=False)
            rec.domain_url = form.data['schema_name'] + '.' + current_site.domain
            rec.save()
            site = 'http://'+form.data['schema_name']+'.' + current_site.name
            if DEBUG:
                site += ':8000'
            return HttpResponseRedirect(site)
        else:
            messages.error(request, _('Что-то пошло не так'))
            return super().post(self, request, *args, **kwargs)
