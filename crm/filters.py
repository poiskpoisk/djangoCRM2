# -*- coding: utf-8 -*-#
__author__ = 'AMA'

# Keep in the mind this is generic FilterView.as_view(model=Model) similar as ListView

import django_filters
from crm.models import Deal
from django.utils.translation import ugettext as _


class DealFilter(django_filters.FilterSet):

    STATUS_CHOICES = [('Z', _('Все контракты') )]
    for STATUS in list(Deal.STATUS_CHOICES):
        STATUS_CHOICES.append(STATUS)
    STATUS_CHOICES = tuple(STATUS_CHOICES)
    label=Deal._meta.get_field('status').verbose_name.title()
    status = django_filters.ChoiceFilter(choices=STATUS_CHOICES, method='filter_deal', label=label )

    def filter_deal(self, queryset, name, value):
        if value=='Z':
            queryset = Deal.objects.all()
        else:
            queryset = queryset.filter( status__exact=value )

        return queryset

    class Meta:
        model = Deal
        fields = ['status','sales_person']


DealFilter.base_filters['status'].field.help_text=_('<h5><small>Выберите статус сделки</small></h5>')
DealFilter.base_filters['sales_person'].field.help_text=_('<h5><small>Выберите менеджера по продажам</small></h5>')


class ReportFilter(django_filters.FilterSet):

    class Meta:
        model = Deal
        fields = ['data_time']