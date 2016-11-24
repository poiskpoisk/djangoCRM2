# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from crm.filters import DealFilter, DealFilterWithoutData, TodoFilter, TodoFilterWithoutData, ReportFilter
from crm.tables import DealsTable
from django.views.generic import UpdateView, CreateView, DeleteView
from django.conf.urls import url
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib.auth.decorators import login_required
from crm.views.table_views import tableSalesPerson, tableFilterDeals, tableFilterToDos, tableFilterCustomer
from crm.views.deal_views import DealUpdateView, DealCreateView
from crm.views.views import setLang, reportFunnel, reportSalesPerson
from crm.models import SalesPerson, Todo, Customer, Deal
from crm.forms import SalesPersonForm, ToDoForm, CustomerForm, DealForm


# common URLS prefix is /crm/
urlpatterns = [
    # For DetaivView we must transmit to the view pk field
    # LAZY !!! must have. You use reverse before URLconf setting was load

    # ----------------------- Sales Person ------------------------------------------------------------------------

    url(r'^salespersons/(?P<pk>[0-9]+)/$', login_required(UpdateView.as_view(   model=SalesPerson,
                                                                                template_name='crm/salesperson.html',
                                                                                form_class=SalesPersonForm,
                                                                                success_url = reverse_lazy('salespersons')
                                                                             )), name='salespersonpage'),

    url(r'^salespersons/del/(?P<pk>[0-9]+)/$', login_required(DeleteView.as_view(   model=SalesPerson,
                                                                                template_name='crm/salesperson_del.html',
                                                                                success_url = reverse_lazy('salespersons')
                                                                             )), name='salesperson_del'),

    url(r'^salespersons/$', tableSalesPerson, name='salespersons'),

    url(r'^salespersons/new/$', login_required(CreateView.as_view(  model= SalesPerson,
                                                                    template_name='crm/salesperson_new.html',
                                                                    form_class = SalesPersonForm,
                                                                    success_url=reverse_lazy('salespersons')
                                                                    )), name='salesperson_new'),

    # ---------------------------- ToDo ------------------------------------------------------------

    url(r'^todos/(?P<pk>[0-9]+)/$', login_required(UpdateView.as_view(  model=Todo,
                                                                        template_name='crm/todo.html',
                                                                        form_class=ToDoForm,
                                                                        success_url=reverse_lazy('todos')
                                                                             )), name='todopage'),

    url(r'^todos/del/(?P<pk>[0-9]+)/$', login_required(DeleteView.as_view(model=Todo,
                                                                                 template_name='crm/todo_del.html',
                                                                                 success_url=reverse_lazy('todos')
                                                                                 )), name='todo_del'),

    url(r'^todos/$', tableFilterToDos, name='todos'),

    url(r'^todos/new/$', login_required(CreateView.as_view( model=Todo,
                                                            template_name='crm/todo_new.html',
                                                            form_class=ToDoForm,
                                                            success_url=reverse_lazy('todos')
                                                              )), name='todo_new'),
    # .................... with filters ................................................................................

    url(r'^todosfilters/$', tableFilterToDos, {'classFilter': TodoFilter}, name='todosfilters'),
    url(r'^todostoday/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData, 'duration': 'day'}, name='todostoday'),
    url(r'^todosmonth/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData,  'duration': 'month'}, name='todosmonth'),
    url(r'^todosyear/$', tableFilterToDos, {'classFilter': TodoFilterWithoutData,  'duration': 'year'}, name='todosyear'),

    # ------------------------- Customer -----------------------------------------------------------------------

    url(r'^customers/(?P<pk>[0-9]+)/$', login_required(UpdateView.as_view(model=Customer,
                                                                      template_name='crm/customer.html',
                                                                      form_class=CustomerForm,
                                                                      success_url=reverse_lazy('customers')
                                                                      )), name='customerpage'),

    url(r'^customers/del/(?P<pk>[0-9]+)/$', login_required(DeleteView.as_view(model=Customer,
                                                                          template_name='crm/customer_del.html',
                                                                          success_url=reverse_lazy('customers')
                                                                          )), name='customer_del'),

    url(r'^customers/$', tableFilterCustomer, name='customers'),

    url(r'^customers/new/$', login_required(CreateView.as_view(model=Customer,
                                                           template_name='crm/customer_new.html',
                                                           form_class=CustomerForm,
                                                           success_url=reverse_lazy('customers')
                                                           )), name='customer_new'),

    # ----------------------------- Deal -------------------------------------------------------------------------

    url(r'^deal/(?P<pk>[0-9]+)/$', login_required(DealUpdateView.as_view()), name='dealpage'),
    url(r'^deal/del/(?P<pk>[0-9]+)/$', login_required(DeleteView.as_view(model=Deal,
                                                                          template_name='crm/deal_del.html',
                                                                          success_url=reverse_lazy('deals')
                                                                          )), name='deal_del'),
    url(r'^deal/$', tableFilterDeals, name='deals'),
    url(r'^deal/new/$', login_required(DealCreateView.as_view(model=Deal,
                                                           template_name='crm/deal_new.html',
                                                           form_class=DealForm,
                                                           success_url=reverse_lazy('deals')
                                                           )), name='deal_new'),
    # .................... with filters ................................................................................

    url(r'^dealfilters/$', tableFilterDeals, {'classFilter': DealFilter}, name='dealsfilters'),
    url(r'^dealstoday/$', tableFilterDeals, {'classFilter': DealFilterWithoutData, 'duration': 'day'}, name='dealstoday'),
    url(r'^dealsmonth/$', tableFilterDeals, {'classFilter': DealFilterWithoutData,  'duration': 'month'}, name='dealsmonth'),
    url(r'^dealsyear/$', tableFilterDeals, {'classFilter': DealFilterWithoutData,  'duration': 'year'}, name='dealsyear'),

    # ---------------------------------------------- Reports ------------------------------------------

    url(r'^reportfunnel/$', reportFunnel,  {'model': Deal, 'classFilter': ReportFilter}, name='reportfunnel'),
    url(r'^reportsp/$', reportSalesPerson, {'model': Deal, 'classFilter': DealFilter}, name='reportsp'),

]
