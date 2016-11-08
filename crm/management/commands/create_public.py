# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.core.management import BaseCommand
from globalcustomer.models import Client


# The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create public site. Usage: python manage.py create_public"

    # A command must define handle()
    def handle(self, *args, **options):
        # create your first real tenant
        tenant = Client(domain_url='127.0.0.1',  schema_name='public', name='SaaS')
        tenant.save()  # migrate_schemas automatically called, your tenant is ready to be used!
