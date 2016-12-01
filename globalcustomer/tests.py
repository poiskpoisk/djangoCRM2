from django.contrib.sites.shortcuts import get_current_site
from django.http import HttpRequest
from django.test import LiveServerTestCase
from django.test import TestCase
from django.test import Client as TestClient
from globalcustomer.forms import GlobalClientForm
from globalcustomer.models import Client
from django.core.urlresolvers import reverse

from selenium import webdriver
from simpleCRM.settings import BASE_DIR, DEBUG
from selenium.webdriver.firefox.webdriver import WebDriver
import os, time


# UnitTest with django test client
class NewTenantView(TestCase):

    def test_create_new_tenant_form(self):
        form_data = {'schema_name': 'public', 'name': 'corp_name', 'description': 'some texts'}
        form = GlobalClientForm(data=form_data)
        self.assertTrue(form.is_valid())
        rec = form.save(commit=False)
        rec.domain_url = 'testserver'
        rec.save()
        # create an instance of the client for our use
        client = TestClient()
        url = reverse('globalcustomer', 'globalcustomer.urls')
        response = client.post(url)
        self.assertEqual(response.status_code, 200)

# Integration test with LiveServer and Selenium webdriver.
# For use: python manage.py test --liveserver=example.com:8000
class NewTenantView_selenium(LiveServerTestCase):
    fixtures = ['client.yaml']

    # Called before test ( standard features )
    @classmethod
    def setUpClass(cls):
        """ Instantiate selenium driver instance """
        chromedriver = BASE_DIR + "/geckodriver"
        os.environ["webdriver.firefox.driver"] = chromedriver
        cls.driver = webdriver.Chrome(chromedriver)
        super().setUpClass()

    @classmethod
    def tearDownClass(cls):
        """ Quit selenium driver instance """
        cls.driver.quit()
        super().tearDownClass()

    def test_create_new_tenant_form(self):
        self.driver.get( self.live_server_url )
        self.driver.implicitly_wait(100)
        schema_name = self.driver.find_element_by_id("id_schema_name")
        schema_name.send_keys("a5")
        name = self.driver.find_element_by_id("id_name")
        name.send_keys("a5_corp")
        desc = self.driver.find_element_by_id("id_description")
        desc.send_keys("This is A5 corp")
        button = self.driver.find_element_by_tag_name("button")
        self.driver.implicitly_wait(1000)
        button.click()
        time.sleep(10)
        record = Client.objects.get(name="a5_corp")
        self.assertEqual(record.schema_name, "a5")


