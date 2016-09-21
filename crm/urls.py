# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.conf.urls import url
from . import views

# /crm/
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^salespersons/(?P<salesperson_id>[0-9]+)/$', views.salesPersonPage, name='salespersonpage'),
    url(r'^salespersons/$', views.salesPersonsList, name='salespersons'),
    url(r'^lang/', views.setLang, name='lang'),
]

