from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
# Опять же, спасибо django за готовую форму аутентификации.
from django.contrib.auth.forms import AuthenticationForm
# Функция для установки сессионного ключа.
# По нему django будет определять, выполнил ли вход пользователь.
from django.contrib.auth import login
from django.views.generic.edit import FormView
from django.contrib.auth import logout
from django.views.generic.base import View
from django.http import HttpResponseRedirect
from .models import SalesPerson
from registration.backends.simple.views import RegistrationView
from .forms import SalesPersonForm
from django.shortcuts import redirect


def index(request):
    return HttpResponse("Main page for CRM system")


def salesPersonsList(request):
    # get list of NOT NULL
    lst = get_list_or_404( SalesPerson, first_name__isnull=False )
    number = len(lst)
    context = {'list_all_sales_persons': lst,
               'number_of_sale_persons': number,
               }
    return render(request, 'crm/salespersons.html', context)


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

'''
class RegisterFormView(FormView):
    form_class = UserCreationForm

    # Ссылка, на которую будет перенаправляться пользователь в случае успешной регистрации.
    # В данном случае указана ссылка на страницу входа для зарегистрированных пользователей.
    success_url = "/crm/"

    # Шаблон, который будет использоваться при отображении представления.
    template_name = "crm/register.html"

    def form_valid(self, form):
        # Создаём пользователя, если данные в форму были введены корректно.
        form.save()

        # Вызываем метод базового класса
        return super(RegisterFormView, self).form_valid(form)


class LoginFormView(FormView):
    form_class = AuthenticationForm

    # Аналогично регистрации, только используем шаблон аутентификации.
    template_name = "crm/login.html"

    # В случае успеха перенаправим на главную.
    success_url = "/crm/"

    def form_valid(self, form):
        # Получаем объект пользователя на основе введённых в форму данных.
        self.user = form.get_user()

        # Выполняем аутентификацию пользователя.
        login(self.request, self.user)
        return super(LoginFormView, self).form_valid(form)


class LogoutView(View):
    def get(self, request):
        # Выполняем выход для пользователя, запросившего данное представление.
        logout(request)

        # После чего, перенаправляем пользователя на главную страницу.
        return HttpResponseRedirect("/crm")

'''