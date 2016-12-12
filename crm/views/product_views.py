# -*- coding: utf-8 -*-#
from django.contrib.auth.decorators import login_required
from django.utils import translation
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DeleteView
from django.core.urlresolvers import reverse
from django.views.generic import UpdateView

from guardian.decorators import permission_required

from crm.forms import ProductForm
from crm.mixin import add_lang
from crm.models import Product

__author__ = 'AMA'


class ProductDeleteView(DeleteView):
    model = Product
    template_name = 'crm/product_del.html'

    def get_success_url(self):
        return reverse('products')

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.delete_product', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)


class ProductUpdateView(UpdateView):
    model = Product
    form_class = ProductForm
    template_name = 'crm/product.html'

    def get_success_url(self):
        return reverse('product_page', kwargs={'pk': self.kwargs['pk']})

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.change_product', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.change_product', accept_global_perms=True))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)


class ProductCreateView(CreateView):
    model = Product
    template_name = 'crm/product_new.html'
    form_class = ProductForm

    def get_success_url(self):
        return reverse('products')

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.add_product', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.add_product', accept_global_perms=True))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)