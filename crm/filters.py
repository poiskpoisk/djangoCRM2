# -*- coding: utf-8 -*-#
__author__ = 'AMA'

# Keep in the mind this is generic FilterView.as_view(model=Model) similar as ListView

import django_filters
from crm.models import Deal
from django.utils.translation import ugettext as _

class DealFilter(django_filters.FilterSet):

    class Meta:
        model = Deal
        fields = ['status','sales_person']


DealFilter.base_filters['status'].field.help_text=_('<h5><small>Выберите статус сделки</small></h5>')
DealFilter.base_filters['sales_person'].field.help_text=_('<h5><small>Выберите менеджера по продажам</small></h5>')