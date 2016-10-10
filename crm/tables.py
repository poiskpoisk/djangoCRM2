# -*- coding: utf-8 -*-#
from django.contrib.auth.models import User

__author__ = 'AMA'

import django_tables2 as tables
from .models import SalesPerson
from django_tables2.utils import A  # alias for Accessor


class SalesPersonTable(tables.Table):

    email = tables.Column()
    id = tables.LinkColumn('salespersonpage', args=[A('pk')])

    class Meta:
        model = SalesPerson
        exclude = ('avatar',)
        # add class="paleblue" to <table> tag
        attrs = {'class': 'paleblue table table-striped table-bordered'}