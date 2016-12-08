#!/bin/bash
dropdb scrm
createdb scrm

rm -rf ./crm/migrations/*.py
cp ./simpleCRM/__init__.py ./crm/migrations/__init__.py

pmmm

pm migrate_schemas
pm create_public

pm create_tenant a1 example.com

#python3 manage.py createsuperuser --username=ama --schema=public --email a@as.com
#python3 manage.py createsuperuser --username=ama --schema=a1 --email a@as.com












