from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.shortcuts import render
from django_tables2 import RequestConfig

from crm.tables import SalesPersonTable, DealsTable
from crm.models import SalesPerson, Deal
from crm.filters import ReportFilter


@login_required
def tableSalesPerson(request):

    queryset = SalesPerson.objects.annotate(email=F('user__email'))
    table = SalesPersonTable(queryset)
    RequestConfig(request).configure(table)
    filter = 'NONFILTER'
    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})


@login_required
def tableFilterCommon(request, model, modelTable, classFilter=None):

    if classFilter :
        filter = classFilter(request.GET, queryset=model.objects.all())
        queryset = filter.qs
    else:
        queryset = model.objects.all()
        filter = 'NONFILTER'

    table = modelTable(queryset)
    RequestConfig(request).configure(table)

    return render( request, 'crm/common_table_list.html', {'table': table, 'filter': filter} )

@login_required
def reportFunnel(request, model, modelTable, classFilter=None):

    #filter = ReportFilter(request.GET, queryset=Deal.objects.all())

    records=[]
    for status in Deal.STATUS_CHOICES:
        record = []
        record.append(status[1])
        record.append(Deal.objects.filter( status=status[0] ).count())
        records.append(record)


    return render(request, 'crm/report.html', {'records': records, 'filter': filter })

def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')






