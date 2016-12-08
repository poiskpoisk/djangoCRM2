# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.contrib.auth.models import User
from tenant_schemas.utils import schema_context

#User.objects.create_superuser('ama', 'alex.abakumov@gmail.com', 'alex1972')

with schema_context('a1'):
    User.objects.create_superuser('ama', 'alex.abakumov@gmail.com', 'alex1972')
