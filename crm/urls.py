# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from crm.views import setLang, salesperson_new, salesPersonPage
from crm.views import SalesPersonsList


# /crm/
urlpatterns = [
    url(r'^salespersons/(?P<salesperson_id>[0-9]+)/$', salesPersonPage, name='salespersonpage'),
    url(r'^salespersons/$', login_required(SalesPersonsList.as_view(template_name='crm/salespersons.html')), name='salespersons'),
    url(r'^salespersons/new/$', salesperson_new,  name='salesperson_new'),
    url(r'^lang/', setLang,                       name='lang'),
]

