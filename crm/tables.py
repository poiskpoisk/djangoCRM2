# -*- coding: utf-8 -*-#
from crm.mixin import SomeUtilsMixin

__author__ = 'AMA'

import django_tables2 as tables
from .models import SalesPerson, Todo, Customer, Deal, Product
from django.utils.translation import ugettext as _
from django_tables2.utils import A  # alias for Accessor


class SalesPersonTable(tables.Table):
    email = tables.Column()
    id = tables.LinkColumn('salespersonpage', args=[A('pk')])

    class Meta:
        model = SalesPerson
        exclude = ('avatar',)
        attrs = {'class': 'paleblue table table-striped table-bordered'}  # add class="paleblue" to <table> tag
        empty_text = _(
            'Пока нет ни одного менеджера по продажам. Для добавления используйте соответствующий пункт меню')


class ToDosTable(tables.Table):
    id = tables.LinkColumn('todopage', args=[A('pk')])

    class Meta:
        model = Todo
        attrs = {'class': 'paleblue table table-striped table-bordered'}
        empty_text = _(
            'Пока нет ни одного запланированного дела. Для добавления используйте соответствующий пункт меню')


class CustomersTable(tables.Table):
    id = tables.LinkColumn('customer_page', args=[A('pk')])

    class Meta:
        model = Customer
        exclude = ('avatar', 'comment')
        attrs = {'class': 'paleblue table table-striped table-bordered'}
        empty_text = _('Пока нет ни одного клиента. Для добавления используйте соответствующий пункт меню')

class ProductTable(tables.Table):
    id = tables.LinkColumn('product_page', args=[A('pk')])

    class Meta:
        model = Product
        attrs = {'class': 'paleblue table table-striped table-bordered'}
        empty_text = _('Пока нет ни одного продукта. Для добавления используйте соответствующий пункт меню')

class DealsTable(tables.Table, SomeUtilsMixin):
    id = tables.LinkColumn('dealpage', args=[A('pk')])
    deal_data = tables.DateTimeColumn(format="d/m/Y", verbose_name=_('Дата'))
    deal_time = tables.DateTimeColumn(format="H.i", verbose_name=_('Время'))
    deal_status = tables.Column( verbose_name=_('Статус'))

    def order_deal_data(self, queryset, is_descending):
        if is_descending:
            queryset = queryset.order_by('-deal_data')
        else:
            queryset = queryset.order_by('deal_data')
        return (queryset, True)

    def order_deal_time(self, queryset, is_descending):
        if is_descending:
            queryset = queryset.order_by('-deal_time')
        else:
            queryset = queryset.order_by('deal_time')
        return (queryset, True)

    def order_deal_status(self, queryset, is_descending):
        if is_descending:
            queryset = queryset.order_by('-deal_status')
        else:
            queryset = queryset.order_by('deal_status')
        queryset=self.doHumanReadble_STATUS_CHOICES(queryset)
        return (queryset, True)

    class Meta:
        model = Deal
        attrs = {'class': 'paleblue table table-striped table-bordered'}
        empty_text = _('Пока нет ни одной сделки. Для добавления используйте соответствующий пункт меню')
