from datetimewidget.widgets import DateTimeWidget, DateWidget, TimeWidget
from django import forms
from django.utils.translation import ugettext as _
from crm.models import SalesPerson, Todo, Customer, Deal, Product, DealProducts
from crm.widgets import imageWidget, faWidget


class SalesPersonForm(forms.ModelForm):
    class Meta:
        model = SalesPerson
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'division', 'phone_number', 'mobile_number', 'user')
        widgets = {
            'avatar': imageWidget,
            'first_name': faWidget('fa fa-user fa-lg',
                                   attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name': faWidget('fa fa-user fa-lg',
                                    attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number': faWidget('fa fa-phone fa', attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'),
                                                              'class': 'form-control'}),
            'division': faWidget('fa fa-users fa', attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number': faWidget('fa fa-mobile fa-lg',
                                      attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'),
                                             'class': 'form-control'}),
        }


class ToDoForm(forms.ModelForm):
    class Meta:
        model = Todo
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('action', 'data_time', 'action_description', 'sales_person')
        widgets = {
            'data_time': DateTimeWidget(attrs={'id': "yourdatetimeid"}, usel10n=True, bootstrap_version=3)
        }


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'company', 'position', 'phone_number', 'mobile_number',
                  'email_address', 'brith_data', 'comment', 'status', 'sales_person')
        widgets = {
            'avatar': imageWidget,
            'first_name': faWidget('fa fa-user fa',
                                   attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name': faWidget('fa fa-user fa',
                                    attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number': faWidget('fa fa-phone fa-lg', attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'),
                                                                 'class': 'form-control'}),
            'mobile_number': faWidget('fa fa-mobile fa-lg',
                                      attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'),
                                             'class': 'form-control'}),
            'company': faWidget('fa fa-home fa-lg', attrs={'placeholder': _('Место работы'), 'class': 'form-control'}),
            'position': faWidget('fa fa-arrows-h', attrs={'placeholder': _('Должность'), 'class': 'form-control'}),
            'email_address': faWidget('fa fa-envelope-o', attrs={'class': 'form-control', 'type': 'email',
                                                                 'placeholder': _('Электронная почта')}),
            'brith_data': DateWidget(attrs={'id': "yourdatetimeid"}, usel10n=True, bootstrap_version=3),

        }


class DealForm(forms.ModelForm):
    class Meta:
        model = Deal
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = (
            'sales_person', 'customer', 'ident', 'price', 'description')
        widgets = {
            'price': faWidget('fa fa-usd fa', hidden=True, attrs={'placeholder': _('Предполагаемая сумма сделки (ОБЯЗАТЕЛЬНО)'),
                                                     'class': 'form-control'}),
            'ident': faWidget('fa fa-anchor fa', attrs={'placeholder': _('Уникальный номер сделки (ОБЯЗАТЕЛЬНО)'),
                                                        'class': 'form-control'}),
        }



