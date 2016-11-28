# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django import forms
from globalcustomer.models import Client
from crm.widgets import FaWidget
from django.utils.translation import ugettext as _


class GlobalClientForm(forms.ModelForm):
    schema_name = forms.CharField(label=_("Доменное имя"), widget=FaWidget('fa fa-user fa-lg',
                                                                           attrs={'class': 'form-control',
                                   'placeholder': _('Латинские буквы и цифры, без пробелов (ОБЯЗАТЕЛЬНО)'), 'required': 'true'}))
    class Meta:
        model = Client
        # В форме поля будут в том же порядке, как перечисленны ниже
        fields = '__all__'
        exclude = ['domain_url']
        widgets = {
            'name': FaWidget('fa fa-user fa-lg',
                             attrs={'placeholder': _('Обязательно'),
                                          'class': 'form-control'}),
            'schema_name': FaWidget('fa fa-user fa-lg',
                                    attrs={'placeholder': _('Обязательно'),'label':'ssssss',
                                    'class': 'form-control'}),
        }
