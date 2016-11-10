# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.core.management import BaseCommand
from globalcustomer.models import Client


# The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create tenants. Usage: python manage.py create_tenant tenant_name domen_name"
    missing_args_message='This command must have 2 arguments - tenant_name domen_name'

    # positional arguments
    def add_arguments(self, parser):
        parser.add_argument('tenant', nargs='+', type=str)

    # A command must define handle()
    def handle(self, *args, **options):
        # create your first real tenant
        du = options['tenant'][0] + '.' + options['tenant'][1]
        tenant = Client(domain_url=du,  schema_name=options['tenant'][0], name='aaa')
        tenant.save()  # migrate_schemas automatically called, your tenant is ready to be used!
