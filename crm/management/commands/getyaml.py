# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.core.management import BaseCommand
from django.core import serializers
from simpleCRM.settings import BASE_DIR
import django.apps


# The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create YAML serialization file from models in CRM and related apps"

    # A command must define handle()
    def handle(self, *args, **options):

        models = django.apps.apps.get_models()
        ct = 0
        self.stdout.write("Create .yaml for models in app:")
        self.stdout.write(" ")
        for model in models:
            if 'crm' in model._meta.db_table:
                self.stdout.write("CRM: " + model._meta.model_name)
            elif 'auth_user' in model._meta.db_table:
                self.stdout.write("Auth: " + model._meta.model_name)
            else:
                continue

            data = serializers.serialize("yaml", model.objects.all())
            dir = BASE_DIR + "/crm/fixtures/yamlsrc/" + model._meta.model_name + ".yaml"
            ct +=1
            with open(dir, "w") as out:
                print(data, end="", file=out)

        self.stdout.write(" ")
        self.stdout.write("Number of created .yaml are " + str(ct))
