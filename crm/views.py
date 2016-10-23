import datetime
from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.forms import modelformset_factory
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views.generic import UpdateView
from django_select2.forms import ModelSelect2Widget
from django_tables2 import RequestConfig
from crm.forms import DealForm, DealProductForm
from crm.tables import SalesPersonTable
from crm.models import SalesPerson, Deal, DealProducts, Product
from django.urls import reverse_lazy


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
    success_url = reverse_lazy('deals')

    def __init__(self, *args, **kwargs):
        self.CommonFormset = modelformset_factory(DealProducts, form=DealProductForm,
                                                  extra=1, can_delete=True)

    # Add some more context ( formset )
    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        formset = self.CommonFormset(queryset=DealProducts.objects.filter(deal=self.kwargs['pk']))
        for form in formset:
            try:
                product= Product.objects.get(description=form.instance.product)
                form.item_price = 22
                v=1
                #form.fields['item_price'] = product.price
            except:
                pass


        context['formset'] = formset
        return context


    def get(self, request, *args, **kwargs):
        pass

        return super().get(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):

        request = self.change_request(request)
        form = DealForm(request.POST)
        formset = self.CommonFormset(request.POST)

        if form.is_valid() and formset.is_valid():
            form.save()
            formset.save()
        return super().post(request, *args, **kwargs)

    def change_request(self, request):
        """

        *** This method receive request and change it. ***

        1. Deal field is hidden and don't fill proper value. We need fill it correct value before saving.
        2. User may delete product field from django-select2 widget and we must to mark this form in formset as DELETED

        """

        for i in range(int(request.POST['form-TOTAL_FORMS'])):
            s = 'form-' + str(i)
            sproduct = s + '-product'
            sdeal = s + '-deal'
            sdelete = s + '-DELETE'
            if len(request.POST[sproduct]) > 0:
                request.POST[sdeal] = self.kwargs['pk']
            else:
                request.POST[sdelete] = 'on'

        return request
