from django.contrib.auth.models import User
from django.db.models import F
from django.db.models import Sum, Count
from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.contrib.auth import get_user_model
from django_tables2 import RequestConfig

from crm.tables import SalesPersonTable
from .models import SalesPerson, Todo, Contact
from crm.forms import SalesPersonForm

def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')


class SalesPersonDetail(DetailView):
    model = SalesPerson

class CreateSalesPerson( CreateView ):
    model = SalesPerson
    form_class = SalesPersonForm

class ToDoList(ListView):
    model = Todo
    paginate_by = 20

class ToDoDetail(DetailView):
    model = Todo

def tableSalesPerson(request):

    queryset = SalesPerson.objects.annotate(email=F('user__email'))
    table = SalesPersonTable(queryset)
    RequestConfig(request).configure(table)
    return render(request, 'crm/salespersons.html', {'table': table})