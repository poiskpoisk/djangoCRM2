import doctest
from django.test import TestCase
from crm.views import deal_views
from crm import models as crm_models
from globalcustomer import views as gb_views
from globalcustomer import models as gb_models

'''
Things have changed in Django 1.6:
Doctests will no longer be automatically discovered.
To integrate doctests in your test suite, follow the recommendations in the Python documentation.
http://stackoverflow.com/questions/2380527/django-doctests-in-views-py
'''


def load_tests(loader, tests, ignore):
    tests.addTests(doctest.DocTestSuite(deal_views))
    tests.addTests(doctest.DocTestSuite(crm_models))
    tests.addTests(doctest.DocTestSuite(gb_views))
    tests.addTests(doctest.DocTestSuite(gb_models))
    return tests


# This's classical Unit test
class NewTenant(TestCase):
    fixtures = ['client.yaml']
