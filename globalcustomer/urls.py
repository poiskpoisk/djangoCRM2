# -*- coding: utf-8 -*-#

__author__ = 'AMA'

from globalcustomer.views import GlobalClientCreateView, choose_lang
from django.conf.urls import url

urlpatterns = [
    # For DetaivView we must transmit to the view pk field
    # LAZY !!! must have. You use reverse before URLconf setting was load

    # ----------------------- Create new tenant ------------------------------------------------------------------------

    url(r'^tenant/$', GlobalClientCreateView.as_view(), name='globalcustomer'),
    url(r'^$', choose_lang, name='chooselang'),
    ]