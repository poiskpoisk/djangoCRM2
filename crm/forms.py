from datetimewidget.widgets import DateTimeWidget, DateWidget, TimeWidget
from django import forms
from django.forms import formset_factory, modelformset_factory
from django.utils.translation import ugettext as _
from django_select2.forms import ModelSelect2TagWidget, Select2Widget, ModelSelect2Widget, ModelSelect2MultipleWidget

from crm.models import SalesPerson, Todo, Customer, Deal, Product, DealProducts
from crm.widgets import imageWidget, faWidget
from django.forms import HiddenInput


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
            'sales_person', 'customer', 'ident', 'deal_data', 'deal_time', 'price', 'description', 'status')
        widgets = {
            'deal_data': DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3),
            'deal_time': TimeWidget(attrs={'id': "yourtimeid"}, usel10n=True, bootstrap_version=3),
            'price': faWidget('fa fa-usd fa', attrs={'placeholder': _('Предполагаемая сумма сделки (ОБЯЗАТЕЛЬНО)'),
                                                     'class': 'form-control'}),
            'ident': faWidget('fa fa-anchor fa', attrs={'placeholder': _('Уникальный номер сделки (ОБЯЗАТЕЛЬНО)'),
                                                        'class': 'form-control'}),
        }


class DealProductForm(forms.ModelForm):
    item_price = forms.IntegerField(label=_('Цена за штуку'), disabled=True,
                                    help_text=_(
                                    '<h5><small>Эта строка вычислится автоматически при сохранении формы </h5></small>'))

    total_price = forms.IntegerField(label=_('Цена за все'), disabled=True,
                                    help_text=_(
                                    '<h5><small>Эта строка вычислится автоматически при сохранении формы </h5></small>'))

    class Meta:
        model = DealProducts
        fields = '__all__'
        widgets = {'product': ModelSelect2Widget(model=DealProducts,
                                                 search_fields=['description__icontains'],
                                                 queryset=Product.objects.all()),
                   'deal': HiddenInput()}
