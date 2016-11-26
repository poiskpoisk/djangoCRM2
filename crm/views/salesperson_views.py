# -*- coding: utf-8 -*-#

from django.utils.decorators import method_decorator
from django.views.generic import DeleteView, UpdateView, CreateView
from django.core.urlresolvers import reverse

from guardian.decorators import permission_required

from crm.forms import SalesPersonForm
from crm.models import SalesPerson

__author__ = 'AMA'

class SalesPersonUpdateView(UpdateView):
    model = SalesPerson
    form_class = SalesPersonForm
    template_name = 'crm/salesperson.html'

    def get_success_url(self):
        return reverse('salespersons', kwargs={'pk': self.kwargs['pk']})

    @method_decorator(permission_required('crm.change_salesperson', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)

class SalesPersonDeleteView(DeleteView):
    model = SalesPerson
    template_name = 'crm/salesperson_del.html'

    def get_success_url(self):
        return reverse('salespersons')

    @method_decorator(permission_required('crm.delete_salesperson', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)


class SalesPersonCreateView(CreateView):
    model = SalesPerson,
    template_name = 'crm/salesperson_new.html',
    form_class = SalesPersonForm

    def get_success_url(self):
        return reverse('salespersons')

    @method_decorator(permission_required('crm.create_salesperson', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)
