from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from crm.models import Deal


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


