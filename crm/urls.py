# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.views.generic import UpdateView, CreateView, DeleteView
from django.conf.urls import url
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required

from crm.views import setLang, tableSalesPerson, tableToDos
from crm.views import  ToDoDetail
from crm.models import SalesPerson, Todo
from crm.forms import SalesPersonForm, ToDoForm

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

    url(r'^todos/$', tableToDos, name='todos'),

    url(r'^todos/new/$', login_required(CreateView.as_view( model=Todo,
                                                            template_name='crm/todo_new.html',
                                                            form_class=ToDoForm,
                                                            success_url=reverse_lazy('todos')
                                                              )), name='todo_new'),



    url(r'^lang/', setLang, name='lang'),
]
