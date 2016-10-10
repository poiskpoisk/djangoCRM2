
from django.forms import widgets
from django import forms
from django.utils.translation import ugettext as _
from crm.models import SalesPerson
from crm.widgets import userWidget, usersWidget, phoneWidget, mobilePhoneWidget


class SalesPersonForm(forms.ModelForm):

    class Meta:
        model = SalesPerson
        # В формк поля будут в том же порядке, как перечисленны ниже
        fields = ('first_name', 'second_name', 'division', 'phone_number', 'mobile_number', 'avatar', 'user' )
        widgets = {
            'first_name'    : userWidget(attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name'   : userWidget(attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number'  : phoneWidget(attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            'division'      : usersWidget(attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number' : mobilePhoneWidget(attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            'avatar'        : widgets.FileInput(attrs={'placeholder': _('Фотография'), 'class': 'form-control'}),
        }


