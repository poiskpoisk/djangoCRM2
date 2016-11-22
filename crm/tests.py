import doctest

from django.test import TestCase
from crm import models as crm_models
from crm.views import deal_views
from crm.views.deal_views import DealUpdateView
from globalcustomer import views as gb_views
from globalcustomer import models as gb_models
from unittest.mock import patch, MagicMock

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


class DealUpdateViewTest(TestCase):

    def test_change_request_status(self):
        request = MagicMock()
        fake_self = MagicMock()
        request.POST = {}  # must have
        fake_self.kwargs = {}
        with patch.dict(request.POST, {'status-TOTAL_FORMS': '2', 'status-0-status': '5', 'status-1-status': '5'}), \
             patch.dict(fake_self.kwargs, {'pk': '3'}):
            request = DealUpdateView.change_request_status(fake_self, request)
            self.assertEqual(request.POST['status-0-deal'], '3')

    @patch.object(deal_views, 'Product')
    def test_change_request_product_no_item_price(self, mock_product):
        # make fake object for receive result from Product.objects.get()
        res = MagicMock()
        res.price = 5
        # fake object Product.objects.get() return fake pr.price ( this 5 )
        mock_product.objects.get.return_value = res

        request = MagicMock()
        request.POST = {}  # must have

        fake_self = MagicMock()
        fake_self.kwargs = {}
        fake_self.total_deal_price = 0

        product = 'products-0-product'
        item_price = 'products-0-item_price'
        qty = 'products-0-qty'
        delete = 'products-0-DELETE'

        with patch.dict(request.POST,
                        {'products-TOTAL_FORMS': '1', item_price: '0', product : '3', qty :'50', delete: 'on' }), \
                        patch.dict(fake_self.kwargs, {'pk': '3'}):
            request = DealUpdateView.change_request_product(fake_self, request)
            self.assertEqual(request.POST['products-0-deal'], '3')
            self.assertEqual(request.POST['products-0-total_price'], '250')
