from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.shortcuts import render
from django_tables2 import RequestConfig

from crm.tables import SalesPersonTable
from crm.models import SalesPerson


@login_required
def tableSalesPerson(request):

    queryset = SalesPerson.objects.annotate(email=F('user__email'))
    table = SalesPersonTable(queryset)
    RequestConfig(request).configure(table)
    return render(request, 'crm/common_table_list.html', {'table': table})


@login_required
def tableCommon(request, model, modelTable):

    queryset = model.objects.all()
    table = modelTable(queryset)
    RequestConfig(request).configure(table)
    return render(request, 'crm/common_table_list.html', {'table': table})

def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')