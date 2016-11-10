import os

from django.contrib.sites.shortcuts import get_current_site
from django.test import TestCase, Client
from django.core.urlresolvers import reverse, reverse_lazy
from selenium import webdriver

class NewGlobalCustomerTest(TestCase):
    # Called before test ( standard features )
    def setUp(self):
        chromedriver = "/home/ama/Downloads/chromedriver"
        os.environ["webdriver.chrome.driver"] = chromedriver
        self.browser = webdriver.Chrome(chromedriver)

    def test_can_start_a_list_and_retrieve_it_later(self):
        site = get_current_site(request).name
        site = 'http://' + form.data['schema_name'] + '.' + site
        if DEBUG:
            site += ':8000'
        self.browser.get('http://127.0.0.1:8000')

        # She notices the page title and header mention to-do lists
        self.assertIn('To-Do', self.browser.title)
        self.fail('Finish the test!')

    # Called after test ( standard features )
    def tearDown(self):
        self.browser.quit()
