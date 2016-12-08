# -*- coding: utf-8 -*-#
from django.contrib.auth.decorators import login_required, permission_required
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DeleteView
from django.core.urlresolvers import reverse
from django.views.generic import UpdateView


from crm.forms import CustomerForm
from crm.models import Customer

__author__ = 'AMA'


class CustomerDeleteView(DeleteView):
    model = Customer
    template_name = 'crm/customer_del.html'

    def get_success_url(self):
        return reverse('customers')

    @method_decorator(permission_required('crm.delete_customer'))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)


class CustomerUpdateView(UpdateView):
    model = Customer
    form_class = CustomerForm
    template_name = 'crm/customer.html'

    def get_success_url(self):
        return reverse('customer_page', kwargs={'pk': self.kwargs['pk']})

    @method_decorator(permission_required('crm.change_customer'))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)

    @method_decorator(permission_required('crm.change_customer'))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)


class CustomerCreateView(CreateView):
    model = Customer
    template_name = 'crm/customer_new.html'
    form_class = CustomerForm

    def get_success_url(self):
        return reverse('customers')

    @method_decorator(permission_required('crm.add_customer'))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)

    @method_decorator(permission_required('crm.add_customer'))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)