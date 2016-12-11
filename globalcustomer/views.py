from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.utils import translation
from django.utils.translation import ugettext_lazy as _
from django.views.generic import CreateView

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
            rec.lang = GlobalClientCreateView.lang
            rec.save()
            site = 'http://' + form.data['schema_name'] + '.' + current_site.name
            if DEBUG:
                site += ':8000'
            return HttpResponseRedirect(site)
        else:
            messages.error(request, _('Что-то пошло не так'))
            return super().post(self, request, *args, **kwargs)
