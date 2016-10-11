from django.contrib.auth.decorators import login_required
from django.db.models import F
from django.shortcuts import render
from django.views.generic.detail import DetailView
from django_tables2 import RequestConfig

from crm.tables import SalesPersonTable, ToDosTable
from crm.models import SalesPerson, Todo

@login_required
def tableSalesPerson(request):

    queryset = SalesPerson.objects.annotate(email=F('user__email'))
    table = SalesPersonTable(queryset)
    RequestConfig(request).configure(table)
    return render(request, 'crm/common_table_list.html', {'table': table})

@login_required
def tableToDos(request):

    queryset = Todo.objects.all()
    table = ToDosTable(queryset)
    RequestConfig(request).configure(table)
    return render(request, 'crm/common_table_list.html', {'table': table})


class ToDoDetail(DetailView):
    model = Todo


def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')