from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect
from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.views.generic.list import ListView

from .forms import SalesPersonForm
from .models import SalesPerson


@login_required(login_url='/accounts/login/')
def yyyt_salesPersonsList(request):
    # get list of NOT NULL
    lst = get_list_or_404( SalesPerson, first_name__isnull=False )
    number = len(lst)
    context = {'list_all_sales_persons': lst,
               'number_of_sale_persons': number,
               }
    return render(request, 'crm/salespersons.html', context)

@login_required(login_url='/accounts/login/')
def salesPersonPage(request, salesperson_id=None ):
    # get list of NOT NULL
    obj = get_object_or_404(SalesPerson, id = salesperson_id)
    context = {'sales_person': obj }
    print( obj.avatar )
    return render(request, 'crm/salesperson.html', context)


def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')

# Add new sale person
@login_required(login_url='/accounts/login/')
def salesperson_new(request):

    if request.method == "POST":
        form = SalesPersonForm(request.POST, request.FILES)
        if form.is_valid():
            new_sale = form.save()
            # Перейти на страницу с данными нового сотрудника
            return redirect(salesPersonPage, salesperson_id=new_sale.pk )
    else:
        form = SalesPersonForm()
    return render(request, 'crm/salesperson_new.html', {'form': form})

#@login_required()
class SalesPersonsList(ListView):
    queryset = SalesPerson.objects.order_by("first_name")
    paginate_by = 20

