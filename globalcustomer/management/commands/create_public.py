# -*- coding: utf-8 -*-#
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.sites.models import Site

__author__ = 'AMA'

from django.core.management import BaseCommand
from globalcustomer.models import Client


# The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create public site. Usage: python manage.py create_public"

    # A command must define handle()
    def handle(self, *args, **options):
        sites=Site.objects.all()
        site = sites[0]
        self.stdout.write('Public address is ' + str(site))

        tenant = Client(domain_url=str(site),  schema_name='public', name='SaaS')
        try:
            tenant.save()  # migrate_schemas automatically called, your tenant is ready to be used!
        except:
            self.stdout.write('Something went wrong. May be this public address already exist.')
