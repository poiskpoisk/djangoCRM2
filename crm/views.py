from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.http import HttpResponseRedirect
from django.views.generic.edit import FormView
from .models import SalesPerson
from .forms import SalesPersonForm
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login, logout
from .forms import LoginForm
from django.contrib.auth.decorators import login_required
from .forms import MyRegistrationFormUniqueEmail


@login_required(login_url='/accounts/login/')
def salesPersonsList(request):
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


class LoginView(FormView):

    form_class = LoginForm
    success_url = '/crm/salespersons/'
    template_name = 'registration/login.html'

    def form_valid(self, form):
        username = form.cleaned_data['username']
        password = form.cleaned_data['password']
        user = authenticate(username=username, password=password)

        if user is not None and user.is_active:
            login(self.request, user)
            return super(LoginView, self).form_valid(form)
        else:
            return self.form_invalid(form)


def registerNewUser(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form1 = MyRegistrationFormUniqueEmail(request.POST, prefix="form1")
        form2 = SalesPersonForm(request.POST, prefix="form2")
        # check whether it's valid:
        if form1.is_valid() and form2.is_valid():
            # process the data in form.cleaned_data as required
            user = form1.save()
            profile = form2.save(False)
            profile.user = user
            profile.save()
            # redirect to a new URL:
            return HttpResponseRedirect('/')

    # if a GET (or any other method) we'll create a blank form
    else:
        form1 = MyRegistrationFormUniqueEmail(prefix="form1")
        form2 = SalesPersonForm(prefix="form2")

    icons1 = [ 'fa fa-user fa', 'fa fa-envelope fa',  'fa fa-lock fa-lg', 'fa fa-lock fa-lg']
    icons2 = [ 'fa fa-users fa', 'fa fa-mobile fa-lg', 'fa fa-mobile fa-lg', 'fa fa-camera fa']

    formLogo1=[]
    for field, icon in zip( form1, icons1):
        field.logo = icon
        formLogo1.append(field)

    formLogo2 = []
    for field, icon in zip(form2, icons2):
        field.logo = icon
        formLogo2.append(field)

    return render(request, 'registration/registration_form.html', {'form1': formLogo1, 'form2': formLogo2 })
