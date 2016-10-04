from django import forms
from crm.models import SalesPerson
from django.contrib.auth.forms import AuthenticationForm
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, ButtonHolder, Submit
from django.utils.translation import ugettext as _
from registration.forms import RegistrationFormUniqueEmail
from django.contrib.auth.models import User

class SalesPersonForm(forms.ModelForm):

    class Meta:
        model = SalesPerson
        # В формк поля будут в том же порядке, как перечисленны ниже
        fields = ('first_name', 'second_name','division', 'phone_number', 'mobile_number', 'avatar' )
        widgets = {
            'first_name'    : forms.TextInput(attrs={'placeholder': _('Фамилия (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'second_name'   : forms.TextInput(attrs={'placeholder': _('Имя (ОБЯЗАТЕЛЬНО)'), 'class': 'form-control'}),
            'phone_number'  : forms.TextInput(attrs={'placeholder': _('Телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            'division'      : forms.TextInput(attrs={'placeholder': _('Подразделение'), 'class': 'form-control'}),
            'mobile_number' : forms.TextInput(attrs={'placeholder': _('Моб. телефон: +999999999. До 15 цифр.'), 'class': 'form-control'}),
            'avatar'        : forms.FileInput(attrs={'placeholder': _('Фотография'), 'class': 'form-control'}),
        }

class MyRegistrationFormUniqueEmail(RegistrationFormUniqueEmail):

    username = forms.RegexField( label=_("Логин"), max_length=30, regex=r"^[\w.@+-]+$",
        help_text=_("Не более 30 символов. Допустимо - A-z,1-9,@/./+/-/_ "),
        error_messages={ 'invalid': _("Допустимо только - A-z,1-9,@/./+/-/")},
        widget=forms.TextInput(attrs={'class': 'form-control','required': 'true', 'placeholder': _('Логин ( только A-z,1-9,@/./+/-/_ )')}))

    email = forms.CharField(label=_("Электронная почта"),
                            widget=forms.TextInput(
                            attrs={'class': 'form-control', 'type': 'email', 'placeholder': _('Электронная почта'), 'required': 'true'}))

    password1 = forms.CharField( label=_("Пароль"),
                                 widget=forms.PasswordInput(attrs={'class': 'form-control',
                                                                   'required': 'true',
                                                                   'placeholder': _('Пароль. Не менее 8 знаков, буквы и цифры')}) )
    password2 = forms.CharField( label=_("Подтверждение пароля"),
                                 widget=forms.PasswordInput(
                                 attrs={'class': 'form-control','type': 'password', 'placeholder': _('Подтверждение пароля'), 'required': 'true',}),
                                 help_text=_("Оба пароля должны совпадать."))




class MyAuthenticationForm( AuthenticationForm ):

    username = forms.RegexField(label=_("Логин"), max_length=30, regex=r"^[\w.@+-]+$",
                                help_text=_("Не более 30 символов. Допустимо - A-z,1-9,@/./+/-/_ "),
                                error_messages={'invalid': _("Допустимо только - A-z,1-9,@/./+/-/")},
                                widget=forms.TextInput(
                                attrs={'class': 'form-control', 'required': 'true', 'placeholder': _('Логин')}))

    password = forms.CharField(label=_("Пароль"),
                                widget=forms.PasswordInput(
                                    attrs={'class': 'form-control', 'required': 'true', 'placeholder': _('Пароль')}))

