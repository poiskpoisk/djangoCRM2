# -*- coding: utf-8 -*-#
import datetime

from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.shortcuts import render
from django_tables2 import RequestConfig

from crm.models import SalesPerson, DealStatus
from crm.tables import SalesPersonTable

__author__ = 'AMA'


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
        queryset = queryset.annotate(deal_data=F('dealstatus__deal_data'))
        queryset = queryset.annotate(deal_time=F('dealstatus__deal_time'))
        queryset = queryset.annotate(deal_status=F('dealstatus__status'))
        filter = 'NONFILTER'

    for query in queryset:
        queryset_deal = queryset.filter(pk=query.pk).order_by('-deal_data', '-deal_time')
        if len(queryset_deal) > 1:
            for query in queryset_deal[1:]:
                queryset = queryset.exclude(pk=query.pk, deal_data=query.deal_data, deal_time=query.deal_time)

    for query in queryset:
        for status in DealStatus.STATUS_CHOICES:
            if query.deal_status == status[0]:
                query.deal_status = status[1]

    table = modelTable(queryset)
    RequestConfig(request).configure(table)

    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})
