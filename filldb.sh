#!/bin/bash
dropdb scrm
createdb scrm

pmmm

pm migrate_schemas

pm create_public
pm create_tenant a1 example.com

pm tenant_command loaddata --schema=a1 user.yaml;
pm tenant_command loaddata --schema=a1 salesperson.yaml;
pm tenant_command loaddata --schema=a1 customer.yaml;
pm tenant_command loaddata --schema=a1 todo.yaml;
pm tenant_command loaddata --schema=a1 product.yaml;
pm tenant_command loaddata --schema=a1 deal.yaml;
pm tenant_command loaddata --schema=a1 dealproducts.yaml;
pm tenant_command loaddata --schema=a1 dealstatus.yaml;
pm tenant_command loaddata --schema=a1 group.yaml

pm create_tenant a2 example.com
pm tenant_command loaddata --schema=a2 user.yaml;
pm tenant_command loaddata --schema=a2 salesperson.yaml;
pm tenant_command loaddata --schema=a2 customer.yaml;
pm tenant_command loaddata --schema=a2 todo.yaml;
pm tenant_command loaddata --schema=a2 product.yaml;
pm tenant_command loaddata --schema=a2 deal.yaml;
pm tenant_command loaddata --schema=a2 dealproducts.yaml;
pm tenant_command loaddata --schema=a2 dealstatus.yaml;
pm tenant_command loaddata --schema=a2 group.yaml

echo "from django.contrib.auth.models import User; User.objects.create_superuser('ama', 'alex.abakumov@gmail.com', 'alex1972')" | python3 manage.py shell




