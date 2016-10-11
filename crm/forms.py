from datetimewidget.widgets import DateTimeWidget
from django import forms
from django.utils.translation import ugettext as _
from crm.models import SalesPerson, Todo
from crm.widgets import imageWidget, faWidget


class SalesPersonForm(forms.ModelForm):

    class Meta:
        model = SalesPerson
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'division', 'phone_number', 'mobile_number', 'user' )
        widgets = {
            'avatar': imageWidget,
            'first_name'    : faWidget('fa fa-user fa', attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name'   : faWidget('fa fa-user fa', attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number'  : faWidget('fa fa-phone fa-lg', attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            'division'      : faWidget('fa fa-users fa',attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number' : faWidget('fa fa-mobile fa-lg',attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
        }


class ToDoForm(forms.ModelForm):

    class Meta:
        model = Todo
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('action','data_time', 'action_description', 'sales_person' )
        widgets = {
            'data_time': DateTimeWidget(attrs={'id':"yourdatetimeid"}, usel10n=True, bootstrap_version=3)
            #'action'        : faWidget('fa fa-hand-pointer-o', attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            #'second_name'   : faWidget('fa fa-user fa', attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            #'phone_number'  : faWidget('fa fa-phone fa-lg', attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            #'division'      : faWidget('fa fa-users fa',attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            #'mobile_number' : faWidget('fa fa-mobile fa-lg',attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
        }
