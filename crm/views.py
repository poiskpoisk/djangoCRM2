from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.http import HttpResponse

def index(request):
    return HttpResponse("Main page for CRM system")

from .models import SalesPerson

def salesPersonsList(request):
    # get list of NOT NULL
    lst = get_list_or_404( SalesPerson, first_name__isnull=False )
    number = len(lst)
    context = {'list_all_sales_persons': lst,
               'number_of_sale_persons': number,
               }
    return render(request, 'crm/salespersons.html', context)

def salesPersonPage(request, salesperson_id):
    # get list of NOT NULL
    obj = get_object_or_404(SalesPerson, id = salesperson_id)
    context = {'sales_person': obj,}
    return render(request, 'crm/salesperson.html', context)

def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')


