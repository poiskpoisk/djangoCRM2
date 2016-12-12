# -*- coding: utf-8 -*-#

from django.conf.urls import url


from crm.views.customer_views import CustomerUpdateView, CustomerDeleteView, CustomerCreateView
from crm.views.product_views import ProductDeleteView, ProductUpdateView, ProductCreateView
from crm.views.salesperson_views import SalesPersonUpdateView, SalesPersonDeleteView, SalesPersonCreateView
from crm.filters import DealFilter, DealFilterWithoutData, TodoFilter, TodoFilterWithoutData, ReportFilter
from crm.views.table_views import tableSalesPerson, tableFilterDeals, tableFilterToDos, tableFilterCustomer, \
    tableProducts
from crm.views.deal_views import DealUpdateView, DealCreateView, DealDeleteView
from crm.views.todo_views import ToDoUpdateView, ToDoCreateView, ToDoDeleteView
from crm.views.views import reportFunnel, reportSalesPerson
from crm.models import Deal


# common URLS prefix is /crm/
urlpatterns = [
    # For DetaivView we must transmit to the view pk field
    # LAZY !!! must have. You use reverse before URLconf setting was load

    # ----------------------- Sales Person ------------------------------------------------------------------------

    url(r'^salespersons/(?P<pk>[0-9]+)/$', SalesPersonUpdateView.as_view(), name='salespersonpage'),
    url(r'^salespersons/del/(?P<pk>[0-9]+)/$', SalesPersonDeleteView.as_view(), name='salesperson_del'),
    url(r'^salespersons/$', tableSalesPerson, name='salespersons'),
    url(r'^salespersons/new/$', SalesPersonCreateView.as_view(), name='salesperson_new'),

    # ----------------------- Products ------------------------------------------------------------------------

    url(r'^products/(?P<pk>[0-9]+)/$', ProductUpdateView.as_view(), name='product_page'),
    url(r'^products/del/(?P<pk>[0-9]+)/$', ProductDeleteView.as_view(), name='product_del'),
    url(r'^products/$', tableProducts, name='products'),
    url(r'^products/new/$', ProductCreateView.as_view(), name='product_new'),

    # ---------------------------- ToDo ------------------------------------------------------------

    url(r'^todos/(?P<pk>[0-9]+)/$', ToDoUpdateView.as_view(), name='todopage'),
    url(r'^todos/del/(?P<pk>[0-9]+)/$', ToDoDeleteView.as_view(), name='todo_del'),
    url(r'^todos/$', tableFilterToDos, name='todos'),
    url(r'^todos/new/$', ToDoCreateView.as_view(), name='todo_new'),
    # .................... with filters ................................................................................

    url(r'^todosfilters/$', tableFilterToDos, {'classFilter': TodoFilter}, name='todosfilters'),
    url(r'^todostoday/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData, 'duration': 'day'}, name='todostoday'),
    url(r'^todosmonth/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData,  'duration': 'month'}, name='todosmonth'),
    url(r'^todosyear/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData,  'duration': 'year'}, name='todosyear'),

    # ------------------------- Customer -----------------------------------------------------------------------

    url(r'^customers/(?P<pk>[0-9]+)/$', CustomerUpdateView.as_view(), name='customer_page'),
    url(r'^customers/del/(?P<pk>[0-9]+)/$', CustomerDeleteView.as_view(), name='customer_del'),
    url(r'^customers/$', tableFilterCustomer, name='customers'),
    url(r'^customers/new/$', CustomerCreateView.as_view(), name='customer_new'),

    # ----------------------------- Deal -------------------------------------------------------------------------

    url(r'^deal/(?P<pk>[0-9]+)/$', DealUpdateView.as_view(), name='dealpage'),
    url(r'^deal/del/(?P<pk>[0-9]+)/$', DealDeleteView.as_view(), name='deal_del'),
    url(r'^deal/$', tableFilterDeals, name='deals'),
    url(r'^deal/new/$', DealCreateView.as_view(), name='deal_new'),
    # .................... with filters ................................................................................

    url(r'^dealfilters/$', tableFilterDeals, {'classFilter': DealFilter}, name='dealsfilters'),
    url(r'^dealstoday/$', tableFilterDeals, {'classFilter': DealFilterWithoutData, 'duration': 'day'}, name='dealstoday'),
    url(r'^dealsmonth/$', tableFilterDeals, {'classFilter': DealFilterWithoutData,  'duration': 'month'}, name='dealsmonth'),
    url(r'^dealsyear/$', tableFilterDeals, {'classFilter': DealFilterWithoutData,  'duration': 'year'}, name='dealsyear'),

    # ---------------------------------------------- Reports ------------------------------------------

    url(r'^reportfunnel/$', reportFunnel,  {'model': Deal, 'classFilter': ReportFilter}, name='reportfunnel'),
    url(r'^reportsp/$', reportSalesPerson, {'model': Deal, 'classFilter': DealFilter}, name='reportsp'),

]

