import datetime

from datetimewidget.widgets import TimeWidget, DateWidget
from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.forms import modelformset_factory
from django.shortcuts import render, render_to_response
from django.forms import HiddenInput
from django.views.generic import UpdateView
from django_select2.forms import ModelSelect2Widget
from django_tables2 import RequestConfig
from crm.forms import DealForm
from crm.tables import SalesPersonTable
from crm.models import SalesPerson, Deal, DealProducts, Product, DealStatus
from django.urls import reverse_lazy, reverse


@login_required
def tableSalesPerson(request):
    queryset = SalesPerson.objects.annotate(email=F('user__email'))
    table = SalesPersonTable(queryset)
    RequestConfig(request).configure(table)
    filter = 'NONFILTER'
    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})


@login_required
def tableFilterCommon(request, model, modelTable, classFilter=None, duration=None):
    '''
    Функция комбинированного показа фильтров и результата фильтрования чрезе таблицы
    Может не содержать фитьтров вообще, тогда classFilter=None . Duration определяет предфильтрацию перед фильтрами.
    '''
    now_date = datetime.date.today()  # Текущая дата (без времени)
    if classFilter:
        if duration == 'day':
            queryset = model.objects.filter(deal_data__year=now_date.year)
            queryset = queryset.filter(deal_data__month=now_date.month)
            queryset = queryset.filter(deal_data__day=now_date.day)
        elif duration == 'month':
            queryset = model.objects.filter(deal_data__year=now_date.year)
            queryset = queryset.filter(deal_data__month=now_date.month)
        elif duration == 'year':
            queryset = model.objects.filter(deal_data__year=now_date.year)
        else:
            queryset = model.objects.all()

        filter = classFilter(request.GET, queryset=queryset)
        queryset = filter.qs
    else:
        queryset = model.objects.all()
        filter = 'NONFILTER'

    table = modelTable(queryset)
    RequestConfig(request).configure(table)

    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})


@login_required
def reportFunnel(request, model, modelTable, classFilter=None):
    # filter = ReportFilter(request.GET, queryset=Deal.objects.all())

    records = []
    for status in Deal.STATUS_CHOICES:
        record = []
        record.append(status[1])
        record.append(Deal.objects.filter(status=status[0]).count())
        records.append(record)

    return render(request, 'crm/report.html', {'records': records, 'filter': filter})


def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')


class DealUpdateView(UpdateView):
    model = Deal
    form_class = DealForm
    template_name = 'crm/deal.html'


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.total_deal_price = 0

        self.ProductFormset = modelformset_factory(DealProducts, fields='__all__',
                                                   widgets={'product': ModelSelect2Widget(
                                                       model=DealProducts, search_fields=['description__icontains'],
                                                       queryset=Product.objects.all())},
                                                   extra=1, can_delete=True)

        self.StatusFormset = modelformset_factory(DealStatus, fields='__all__', extra=1, can_delete=True)


    def get_success_url(self):
        return reverse('dealpage', kwargs={'pk': self.kwargs['pk']})

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
        for i,f in enumerate(context['formset_status']):
            std = 'yourdateid' + str(i)
            stt = 'yourtimeid' + str(i)
            f.fields['deal_data'].widget = DateWidget(attrs={'id': std}, usel10n=True, bootstrap_version=3)
            f.fields['deal_time'].widget = TimeWidget(attrs={'id': stt}, usel10n=True, bootstrap_version=3)
        return context

    def post(self, request, *args, **kwargs):

        request = self.change_request_product(request)
        request = self.change_request_status(request)
        # .save() update record if instance argument is present, but another way .save create new record
        a = Deal.objects.get(pk=self.kwargs['pk'])
        form = DealForm(request.POST, instance=a )
        product_formset = self.ProductFormset(request.POST, prefix='products' )
        status_formset = self.StatusFormset(request.POST, prefix='status')

        if form.is_valid() and product_formset.is_valid() and status_formset.is_valid():
            form.data['price'] = str(self.total_deal_price)
            form.save()
            product_formset.save()
            status_formset.save()

        return super().post(self, request, *args, **kwargs)

    def change_request_product(self, request):
        """

        *** This method receive request and change it. ***

        1. Deal field is hidden and don't fill proper value. We need fill it correct value before saving.
        2. User may delete product field from django-select2 widget and we must to mark this form in formset as DELETED
        3. If item price or total price is empty that we need to calc their for every form in formset

        """
        prefix = 'products-'
        s = prefix +'TOTAL_FORMS'
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
                    if request.POST[delete] !='on': self.total_deal_price += int(request.POST[total_price])
                except:
                    self.total_deal_price += int(request.POST[total_price])
            else:
                # If product field is absent so his is deleted.
                request.POST[delete] = 'on'

        return request

    def change_request_status(self, request):
        """

        *** This method receive request and change it. ***

        1. Deal field is hidden and don't fill proper value. We need fill it correct value before saving.
        2. User may delete product field from django-select2 widget and we must to mark this form in formset as DELETED
        3. If item price or total price is empty that we need to calc their for every form in formset

        """
        prefix = 'status-'
        s = prefix +'TOTAL_FORMS'
        for i in range(int(request.POST[s])):

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