# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.core.management import BaseCommand
from django.core import serializers
from simpleCRM.settings import BASE_DIR
import django.apps

#The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create YAML serialization file from models in CRM app"

    # A command must define handle()
    def handle(self, *args, **options):

        models = django.apps.apps.get_models()
        self.stdout.write("Detected models in CRM app:")
        for model in models:
            if 'crm' in model._meta.db_table:
                self.stdout.write("    " + model._meta.model_name)
                data = serializers.serialize("yaml", model.objects.all())
                dir = BASE_DIR + "/crm/fixtures/" + model._meta.model_name + ".yaml"
                with open(dir, "w") as out:
                    print(data, end="", file=out)
