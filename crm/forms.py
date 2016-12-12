from datetimewidget.widgets import DateWidget, TimeWidget
from django import forms
from django.utils.translation import ugettext_lazy as _
from django_select2.forms import ModelSelect2Widget
from django.contrib.auth.models import User

from crm.models import SalesPerson, Todo, Customer, Deal, Product, DealProducts, DealStatus
from crm.widgets import imageWidget, FaWidget, HiddenWidgetRole, HiddenWidget


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('__all__')


class SalesPersonForm(forms.ModelForm):
    class Meta:
        model = SalesPerson
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'division', 'phone_number', 'mobile_number', 'lang', 'user', 'role')
        widgets = {
            'avatar': imageWidget,
            'first_name': FaWidget('fa fa-user fa-lg',
                                   attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name': FaWidget('fa fa-user fa-lg',
                                    attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number': FaWidget('fa fa-phone fa', attrs={
                'placeholder': _('Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                'class': 'form-control'}),
            'division': FaWidget('fa fa-users fa', attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number': FaWidget('fa fa-mobile fa-lg',
                                      attrs={'placeholder': _(
                                          'Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                                          'class': 'form-control'}),
        }


class SalesPersonUpdateForm(SalesPersonForm):
    class Meta:
        model = SalesPerson
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'division', 'phone_number', 'mobile_number', 'user', 'role', 'lang')
        widgets = {
            'avatar': imageWidget,
            'first_name': FaWidget('fa fa-user fa-lg',
                                   attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name': FaWidget('fa fa-user fa-lg',
                                    attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number': FaWidget('fa fa-phone fa', attrs={
                'placeholder': _('Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                'class': 'form-control'}),
            'division': FaWidget('fa fa-users fa', attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number': FaWidget('fa fa-mobile fa-lg',
                                      attrs={'placeholder': _(
                                          'Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                                             'class': 'form-control'}),
            'role': HiddenWidgetRole('fa fa-user fa-lg', attrs={'class': 'form-control'}),
            'user': HiddenWidget('fa fa-user fa-lg', func=User.objects.get, attrs={'class': 'form-control'}),
        }


class ToDoForm(forms.ModelForm):
    class Meta:
        model = Todo
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = '__all__'
        widgets = {
            'todo_data': DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3),
            'todo_time': TimeWidget(attrs={'id': "yourtimeid"}, usel10n=True, bootstrap_version=3),
        }


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('avatar', 'first_name', 'second_name', 'company', 'position', 'phone_number', 'mobile_number',
                  'email_address', 'brith_data', 'comment', 'status', 'sales_person')
        widgets = {
            'avatar': imageWidget,
            'first_name': FaWidget('fa fa-user fa',
                                   attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name': FaWidget('fa fa-user fa',
                                    attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number': FaWidget('fa fa-phone fa-lg', attrs={
                'placeholder': _('Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                'class': 'form-control'}),
            'mobile_number': FaWidget('fa fa-mobile fa-lg',
                                      attrs={'placeholder': _(
                                          'Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899'),
                                             'class': 'form-control'}),
            'company': FaWidget('fa fa-home fa-lg', attrs={'placeholder': _('Место работы'), 'class': 'form-control'}),
            'position': FaWidget('fa fa-arrows-h', attrs={'placeholder': _('Должность'), 'class': 'form-control'}),
            'email_address': FaWidget('fa fa-envelope-o', attrs={'class': 'form-control', 'type': 'email',
                                                                 'placeholder': _('Электронная почта')}),
            'brith_data': DateWidget(attrs={'id': "yourdatetimeid"}, usel10n=True, bootstrap_version=3),

        }


class BossDealForm(forms.ModelForm):
    class Meta:
        model = Deal
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('sales_person', 'customer', 'ident', 'price', 'description')
        widgets = {
            'todo_data': DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3),
            'todo_time': TimeWidget(attrs={'id': "yourtimeid"}, usel10n=True, bootstrap_version=3)
        }


class ManagerDealForm(forms.ModelForm):
    class Meta:
        model = Deal
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = ('sales_person', 'customer', 'ident', 'price', 'description')
        widgets = {
            'sales_person': HiddenWidget('fa fa-user fa-lg', func=SalesPerson.objects.get,
                                         attrs={'class': 'form-control'}),
            'todo_data': DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3),
            'todo_time': TimeWidget(attrs={'id': "yourtimeid"}, usel10n=True, bootstrap_version=3)
        }


class DealProductForm(forms.ModelForm):
    class Meta:
        model = DealProducts
        fields = '__all__'
        widgets = {'product': ModelSelect2Widget(
            model=DealProducts, search_fields=['description__icontains'],
            queryset=Product.objects.all())}


class DealStatusForm(forms.ModelForm):
    class Meta:
        model = DealStatus
        fields = '__all__'
        widgets = {
            'deal_data': DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3),
            'deal_time': TimeWidget(attrs={'id': "yourtimeid"}, usel10n=True, bootstrap_version=3)
        }
