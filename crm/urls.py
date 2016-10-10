# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.conf.urls import url
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from crm.views import setLang, tableSalesPerson
from crm.views import SalesPersonDetail, CreateSalesPerson, ToDoList, ToDoDetail

# common URLS prefix is /crm/
urlpatterns = [
    # For DetaivView we must transmit to the view pk field
    url(r'^salespersons/(?P<pk>[0-9]+)/$', login_required(SalesPersonDetail.as_view( template_name='crm/salesperson.html' )), name='salespersonpage'),
    url(r'^salespersons/$', tableSalesPerson, name='salespersons'),
    # LAZY !!! must have. You use reverse before URLconf setting was load
    url(r'^salespersons/new/$', login_required(CreateSalesPerson.as_view(template_name='crm/salesperson_new.html',success_url=reverse_lazy('salespersons'))),  name='salesperson_new'),

    url(r'^todos/$', login_required(ToDoList.as_view(template_name='crm/todolist.html')), name='todolist'),
    url(r'^todos/(?P<pk>[0-9]+)/$', login_required(ToDoDetail.as_view( template_name='crm/todo.html' )), name='tododetail'),


    url(r'^lang/', setLang,                   name='lang'),
]

