# -*- coding: utf-8 -*-#

import datetime

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.forms import modelformset_factory
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.utils import translation
from django.utils.decorators import method_decorator
from django.views.generic import UpdateView, CreateView
from django.utils.translation import ugettext_lazy as _
from django.views.generic import DeleteView
from django.contrib.auth.models import User

from datetimewidget.widgets import DateWidget, TimeWidget
from guardian.decorators import permission_required
from guardian.shortcuts import assign_perm
from crm.forms import BossDealForm, DealProductForm, DealStatusForm, ManagerDealForm
from crm.mixin import SomeUtilsMixin
from crm.models import Deal, DealProducts, DealStatus, Product, SalesPerson


class DealUpdateView(UpdateView, SomeUtilsMixin):
    model = Deal
    form_class = BossDealForm
    template_name = 'crm/deal.html'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.total_deal_price = 0

        self.ProductFormset = modelformset_factory(model=DealProducts, form=DealProductForm, extra=1, can_delete=True)
        self.StatusFormset = modelformset_factory(model=DealStatus, form=DealStatusForm, extra=1, can_delete=True)

    def get_success_url(self):
        return reverse('dealpage', kwargs={'pk': self.kwargs['pk']})

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.read_deal', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        self.req = request
        user = User.objects.get(username=request.user.username)

        if user.groups.filter(name='boss').exists():
            DealUpdateView.form_class = BossDealForm
        else:
            DealUpdateView.form_class = ManagerDealForm

        return super().get(self, request, *args, **kwargs)

    # Add some more context ( formset )
    def get_context_data(self, **kwargs):

        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['formset_products'] = self.ProductFormset(queryset=DealProducts.objects.filter(deal=self.kwargs['pk']),
                                                          prefix='products')
        context['formset_status'] = self.StatusFormset(queryset=DealStatus.objects.filter(deal=self.kwargs['pk']),
                                                       prefix='status')
        # We must set uniq id for each datetime picker in each form
        for i, f in enumerate(context['formset_status']):
            std = 'yourdateid' + str(i)
            stt = 'yourtimeid' + str(i)
            f.fields['deal_data'].widget = DateWidget(attrs={'id': std}, usel10n=True, bootstrap_version=3)
            f.fields['deal_time'].widget = TimeWidget(attrs={'id': stt}, usel10n=True, bootstrap_version=3)

        # Patch for initial data for readonly field
        try:
            # If form has errors self.req will undefined and we must handled it
            user = User.objects.get(username=self.req.user)

            if not user.groups.filter(name='boss').exists():
                sales_person = SalesPerson.objects.get(user=user)
                context['form'].fields['sales_person'].initial = sales_person
        except:
            pass

        return context


    @method_decorator(login_required())
    def post(self, request, *args, **kwargs):

        if not self.checkPermissions(request, Deal, 'crm.change_deal'):
            return HttpResponseRedirect(reverse('login'))

        request = self.change_request_product(request)
        request = self.change_request_status(request)

        # .save() update record if instance argument is present, but another way .save create new record
        a = Deal.objects.get(pk=self.kwargs['pk'])
        form = BossDealForm(request.POST, instance=a)
        product_formset = self.ProductFormset(request.POST, prefix='products')
        status_formset = self.StatusFormset(request.POST, prefix='status')

        # Patch for initial data for readonly field
        user = User.objects.get(username=request.user)

        if not user.groups.filter(name='boss').exists():
            # Patch for solve problem with hidden field
            sp = SalesPerson.objects.get(user=request.user)
            form.data['sales_person'] = sp.pk

        if form.is_valid() and product_formset.is_valid() and status_formset.is_valid():
            form.data['price'] = str(self.total_deal_price)
            form.save()
            product_formset.save()
            status_formset.save()
        else:
            messages.error(request, _('Что-то пошло не так'))

        return super().post(self, request, *args, **kwargs)

    def change_request_product(self, request):
        """
        *** This method receive request and change it. PRODUCT formset ***

        1. Deal field is hidden and don't fill proper value. We need fill it correct value before saving.
        2. User may delete product field from django-select2 widget and we must to mark this form in formset as DELETED
        3. If item price or total price is empty that we need to calc their for every form in formset

        """
        prefix = 'products-'
        s = prefix + 'TOTAL_FORMS'
        for i in range(int(request.POST[s])):

            product = prefix + str(i) + '-product'
            item_price = prefix + str(i) + '-item_price'
            total_price = prefix + str(i) + '-total_price'
            deal = prefix + str(i) + '-deal'
            qty = prefix + str(i) + '-qty'
            delete = prefix + str(i) + '-DELETE'

            # if group or individual price field is empty, try get product price from Product model
            # and set group and individual price
            if request.POST[item_price] == '0' or request.POST[total_price] == '0' \
                    or request.POST[item_price] == '' or request.POST[total_price] == '':
                try:
                    pr = Product.objects.get(pk=request.POST[product])
                    request.POST[item_price] = pr.price
                    request.POST[total_price] = str(int(pr.price) * int(request.POST[qty]))
                except:
                    pass
            if len(request.POST[product]) > 0:
                # Deal field does not set in template and therefore we must to setup his manually
                request.POST[deal] = self.kwargs['pk']
                # Count total price only for undeleted fields
                try:
                    if request.POST[delete] != 'on':
                        self.total_deal_price += int(request.POST[total_price])
                except:
                    self.total_deal_price += int(request.POST[total_price])
            else:
                # If product field is absent so his is deleted.
                request.POST[delete] = 'on'

        return request

    def change_request_status(self, request):
        """

        *** This method receive request and change it. STATUS formset ***

        1. Deal field is hidden and don't fill proper value. We need fill it correct value before saving.
        2. User may delete product field from django-select2 widget and we must to mark this form in formset as DELETED

        """
        prefix = 'status-'
        s = prefix + 'TOTAL_FORMS'
        for i in range(int(request.POST[s])):  # request.POST['status-TOTAL_FORMS'] has number of form in formset

            deal = prefix + str(i) + '-deal'
            status = prefix + str(i) + '-status'
            delete = prefix + str(i) + '-DELETE'

            if len(request.POST[status]) > 0:
                # Deal field does not set in template and therefore we must to setup his manually
                request.POST[deal] = self.kwargs['pk']
            else:
                # If product field is absent so his is deleted.
                request.POST[delete] = 'on'

        return request


class DealCreateView(CreateView):
    model = Deal
    template_name = 'crm/deal_new.html'
    form_class = ManagerDealForm

    def get_success_url(self):
        return reverse('deals')

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.add_deal', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        self.req = request
        user = User.objects.get(username=request.user.username)

        if user.groups.filter(name='boss').exists():
            DealCreateView.form_class = BossDealForm
        else:
            DealCreateView.form_class = ManagerDealForm

        return super().get(self, request, *args, **kwargs)

    # Add some more context ( formset )
    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)

        data = {'deal_data': datetime.date.today(), 'deal_time': self.get_now_time5(), 'status': 'E'}
        context['f'] = DealProductForm(self.request.POST)
        context['ff'] = DealStatusForm(data)

        # Patch for initial data for readonly field
        try:
            # If form has errors self.req will undefined and we must handled it
            user = User.objects.get(username=self.req.user)

            if not user.groups.filter(name='boss').exists():
                sales_person = SalesPerson.objects.get(user=user)
                context['form'].fields['sales_person'].initial = sales_person
        except:
            pass

        return context

    @method_decorator(login_required())
    @method_decorator(permission_required('crm.add_deal', accept_global_perms=True))
    def post(self, request, *args, **kwargs):

        self.change_request(request)

        form = BossDealForm(request.POST)
        product_form = DealProductForm(request.POST)
        status_form = DealStatusForm(request.POST)

        # Patch for initial data for readonly field
        user = User.objects.get(username=request.user)

        if not user.groups.filter(name='boss').exists():
            # Patch for solve problem with hidden field
            sp = SalesPerson.objects.get(user=request.user)
            form.data['sales_person'] = sp.pk

        if form.is_valid() and product_form.is_valid() and status_form.is_valid():
            record = form.save()
            pf = product_form.save(commit=False)
            sf = status_form.save(commit=False)
            pf.deal = record
            sf.deal = record
            pf.save()
            sf.save()
            sales_person=record.sales_person
            user = User.objects.get(username=sales_person.user)
            assign_perm('crm.change_deal', user, record)
            assign_perm('crm.delete_deal', user, record)
            return HttpResponseRedirect(reverse('deals'))

        return super().post(self, request, *args, **kwargs)

    def get_now_time5(self):
        # We rounded minutes up to 5 ( requirement DateTime picker )
        time_now = datetime.datetime.now()
        hours = time_now.hour
        minute = int(time_now.minute)
        minute //= 5
        minute *= 5
        minute = int(minute)
        if minute < 9:
            ms = '0' + '{0:d}'.format(minute)
        else:
            ms = '{0:d}'.format(minute)

        return str(hours) + ':' + ms

    def get_success_url(self):
        return reverse('deals')

    def change_request(self, request):

        try:
            pr = Product.objects.get(pk=request.POST['product'])
        except:
            messages.error(request, _('Doh! Something went wrong.'))
            # todo Let do err handler
        else:
            request.POST['item_price'] = str(pr.price)
            request.POST['total_price'] = str(pr.price * int(request.POST['qty']))
            request.POST['price'] = request.POST['total_price']

        return request


class DealDeleteView(DeleteView, SomeUtilsMixin):
    model = Deal
    template_name = 'crm/deal_del.html'

    def get_success_url(self):
        return reverse('deals')

    @method_decorator(login_required())
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        if not self.checkPermissions(request, Deal, 'crm.delete_deal'):
            return HttpResponseRedirect(reverse('login'))
        return super().get(self, request, *args, **kwargs)
