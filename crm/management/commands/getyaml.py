# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.core.management import BaseCommand
from django.core import serializers
from simpleCRM.settings import BASE_DIR
import django.apps
from django.db import connection
from tenant_schemas.utils import schema_context


# The class must be named Command, and subclass BaseCommand
class Command(BaseCommand):
    # Show this when the user types help
    help = "Create YAML serialization file from models in CRM and related apps"

    # A command must define handle()
    def handle(self, *args, **options):

        self.total_yaml_created = 0
        with connection.cursor() as cursor:
            cursor.execute("select nspname from pg_catalog.pg_namespace n"
                           " WHERE n.nspname !~ '^pg_' AND n.nspname <> 'information_schema'")
            schemas = cursor.fetchall()

        self.stdout.write(" ")
        self.stdout.write('We founded these schemas:')
        self.stdout.write(" ")
        for schema in schemas:
            self.stdout.write(schema[0])

        for schema in schemas:

            with schema_context(schema[0]):
                self.get_yaml_for_all_models(schema[0])

        self.stdout.write(" ")
        self.stdout.write("We created total "+str(self.total_yaml_created)+" .yaml for DB ")

    def get_yaml_for_all_models(self, schema):

        models = django.apps.apps.get_models()
        ct = 0
        self.stdout.write(" ")
        self.stdout.write("Create .yaml for these models in schema " + str(schema) + " :")
        self.stdout.write(" ")

        for model in models:
            self.stdout.write(model._meta.db_table)

            if schema != 'public':
                if 'crm' in model._meta.db_table:
                    self.stdout.write("CRM: " + model._meta.model_name)
                elif 'auth_user' in model._meta.db_table:
                    self.stdout.write("Auth: " + model._meta.model_name)
                elif 'auth_group' in model._meta.db_table:
                    self.stdout.write("Group: " + model._meta.model_name)
                else:
                    continue

                data = serializers.serialize("yaml", model.objects.all())
                dir = BASE_DIR + "/crm/fixtures/yamlsrc/" + str(schema)+'__'+model._meta.model_name + ".yaml"
                ct += 1
                with open(dir, "w") as out:
                    print(data, end="", file=out)

        self.stdout.write(" ")
        self.stdout.write("Number of created .yaml for schema "+str(schema)+" are " + str(ct))
        self.total_yaml_created+=ct
