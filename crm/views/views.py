from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from crm.filters import ReportFilter
from crm.models import DealStatus, Deal
from django.db.models import F
from django.db.models import Sum


@login_required
def reportFunnel(request, model, modelTable, classFilter=None):

    queryset = Deal.objects.all()
    queryset = queryset.annotate(deal_data=F('dealstatus__deal_data'))
    queryset = queryset.annotate(deal_time=F('dealstatus__deal_time'))
    queryset = queryset.annotate(deal_status=F('dealstatus__status'))

    filter = ReportFilter(request.GET, queryset=queryset)
    queryset = filter.qs


    records = []
    for status in DealStatus.STATUS_CHOICES:
        record = []
        record.append(status[1])
        record.append(queryset.filter(deal_status=status[0]).count())
        records.append(record)

    recordsMany = []
    for status in DealStatus.STATUS_CHOICES:
        record = []
        record.append(status[1])
        sum_pr=queryset.filter(deal_status=status[0]).aggregate(Sum('price'))
        sum_str=str(sum_pr['price__sum'])
        if sum_str == "None":
            sum_str='0'
        sum_int=float(sum_str)
        record.append(sum_int)
        recordsMany.append(record)

    return render(request, 'crm/report.html', {'records': records, 'records_many': recordsMany, 'filter': filter})


def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')


