# -*- coding: utf-8 -*-#
__author__ = 'AMA'

# Keep in the mind this is generic FilterView.as_view(model=Model) similar as ListView
# Можно переопределять фильтры, например ChoiceFilter и условия фильтрования определяя
# при вызове фильтра специальный метод для этого
# METHOD is optional argument that tells the filter how to handle the queryset.

import django_filters
from django_filters.widgets import RangeWidget
from crm.models import Deal, DealStatus, Todo
from django.utils.translation import ugettext as _
from datetimewidget.widgets import DateWidget


class DealFilter(django_filters.FilterSet):
    STATUS_CHOICES = [('Z', _('Все контракты'))]

    for STATUS in list(DealStatus.STATUS_CHOICES):
        STATUS_CHOICES.append(STATUS)
    STATUS_CHOICES = tuple(STATUS_CHOICES)

    label = DealStatus._meta.get_field('status').verbose_name.title()
    status = django_filters.ChoiceFilter(choices=STATUS_CHOICES, method='filter_deal', label=label)

    label = DealStatus._meta.get_field('deal_data').verbose_name.title()
    deal_data = django_filters.DateTimeFromToRangeFilter(label=label,
                                                         widget=RangeWidget(attrs={'placeholder': 'YYYY-MM-DD'}))

    deal_data.widget.widgets[0] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)
    deal_data.widget.widgets[1] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)

    def filter_deal(self, queryset, name, value):
        if value != 'Z':
            queryset = queryset.filter(dealstatus__status__exact=value)

        return queryset

    class Meta:
        model = Deal
        fields = ['sales_person']


DealFilter.base_filters['status'].field.help_text = _('<h5><small>Выберите статус сделки</small></h5>')
DealFilter.base_filters['sales_person'].field.help_text = _('<h5><small>Выберите менеджера по продажам</small></h5>')
DealFilter.base_filters['deal_data'].field.help_text = _(
    '<h5><small>Выберите временной диапазон для показа</small></h5>')


class DealFilterWithoutData(django_filters.FilterSet):
    STATUS_CHOICES = [('Z', _('Все контракты'))]
    for STATUS in list(DealStatus.STATUS_CHOICES):
        STATUS_CHOICES.append(STATUS)
    STATUS_CHOICES = tuple(STATUS_CHOICES)

    label = DealStatus._meta.get_field('status').verbose_name.title()
    status = django_filters.ChoiceFilter(choices=STATUS_CHOICES, method='filter_deal', label=label)

    def filter_deal(self, queryset, name, value):
        if value == 'Z':
            queryset = Deal.objects.all()
        else:
            queryset = queryset.filter(status__exact=value)

        return queryset

    class Meta:
        model = Deal
        fields = ['status', 'sales_person']


DealFilterWithoutData.base_filters['status'].field.help_text = _('<h5><small>Выберите статус сделки</small></h5>')
DealFilterWithoutData.base_filters['sales_person'].field.help_text = _(
    '<h5><small>Выберите менеджера по продажам</small></h5>')

class TodoFilterWithoutData(django_filters.FilterSet):


    class Meta:
        model = Todo
        fields = ['sales_person']

DealFilterWithoutData.base_filters['sales_person'].field.help_text = _(
    '<h5><small>Выберите менеджера по продажам</small></h5>')

class ReportFilter(django_filters.FilterSet):
    label = DealStatus._meta.get_field('deal_data').verbose_name.title()
    deal_data = django_filters.DateTimeFromToRangeFilter(label=label,
                                                         widget=RangeWidget(attrs={'placeholder': 'YYYY-MM-DD'}))

    deal_data.widget.widgets[0] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)
    deal_data.widget.widgets[1] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)

    class Meta:
        model = Deal
        fields = ['sales_person']


ReportFilter.base_filters['sales_person'].field.help_text = _('<h5><small>Выберите менеджера по продажам</small></h5>')
ReportFilter.base_filters['deal_data'].field.help_text = _(
    '<h5><small>Выберите временной диапазон для показа</small></h5>')


class TodoFilter(django_filters.FilterSet):

    label = DealStatus._meta.get_field('deal_data').verbose_name.title()
    todo_data = django_filters.DateTimeFromToRangeFilter(label=label,
                                                         widget=RangeWidget(attrs={'placeholder': 'YYYY-MM-DD'}))

    todo_data.widget.widgets[0] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)
    todo_data.widget.widgets[1] = DateWidget(attrs={'id': "yourdateid"}, usel10n=True, bootstrap_version=3)

    class Meta:
        model = Todo
        fields = ['sales_person']

TodoFilter.base_filters['sales_person'].field.help_text = _('<h5><small>Выберите менеджера по продажам</small></h5>')
TodoFilter.base_filters['todo_data'].field.help_text = _(
    '<h5><small>Выберите временной диапазон для показа</small></h5>')
