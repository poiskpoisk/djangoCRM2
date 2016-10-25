"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".
Replace this with more appropriate tests for your application.
"""
from django.test import TestCase
from django.http import HttpRequest
from crm.views import tableSalesPerson

class SimpleTest(TestCase):
    def test_basic_addition(self):
        """
        Tests that 1 + 1 always equals 2.
        """
        self.assertEqual(1 + 1, 2)

#------------------------------- VIEWs tests --------------------------------------------------------------

# Test Sales Person table
class HomePageTest(TestCase):
    def test_sales_persons_table_returns_correct_html(self):
        request = HttpRequest() #
        response = tableSalesPerson(request) #
        self.assertTrue(response.content.startswith('<html>')) #
        self.assertIn('Всего менеджеров по продажам', response.content)
        self.assertTrue(response.content.endswith('</html>'))


from django.test import TestCase

# Create your tests here.

# Тест на отправку писем
#from django.core.mail import send_mail
#send_mail('Тема', 'Тело письма', EMAIL_HOST_USER, ['alex.abakumov@gmail.com'])
