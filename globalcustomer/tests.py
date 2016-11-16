'''
>>> 2+2==4
False
'''

import os
from django.contrib.sites.shortcuts import get_current_site
from django.http import HttpRequest
from django.test import LiveServerTestCase
from django.test import TestCase
from globalcustomer.models import Client
from selenium import webdriver
import time
from simpleCRM.settings import BASE_DIR, DEBUG
from selenium.webdriver.firefox.webdriver import WebDriver
from globalcustomer.management.commands.create_public import Command as CreatePublic


'''class NewGlobalCustomerTest(LiveServerTestCase):

    @classmethod
    def setUpClass(cls):
        """ Instantiate selenium driver instance """
        #chromedriver = BASE_DIR + "/geckodriver"
        #os.environ["webdriver.firefox.driver"] = chromedriver
        #cls.driver = webdriver.Chrome(chromedriver)


        cls.driver = WebDriver()
        super().setUpClass()

    @classmethod
    def tearDownClass(cls):
        """ Quit selenium driver instance """
        cls.driver.quit()
        super().tearDownClass()

    # Called before test ( standard features )


    def setUpClass(cls):
        chromedriver = BASE_DIR+"/chromedriver"
        os.environ["webdriver.chrome.driver"] = chromedriver
        cls.driver = webdriver.Chrome(chromedriver)
        cls.driver.implicitly_wait(10)
        super().SetUp(cls)


    def test_title(self):

        try:
            record = Client.objects.get(schema_name='a1')
        except:
            print("Shema witn A1 name is absent")
        else:
            record.delete()

        request = HttpRequest()
        site = 'http://' + get_current_site(request).name
        if DEBUG:
           site += ':8000'
        self.driver.get(site)
        self.driver.implicitly_wait(100)
        schema_name = self.driver.find_element_by_id("id_schema_name")
        schema_name.send_keys("a1")
        name = self.driver.find_element_by_id("id_name")
        name.send_keys("a1_corp")
        desc = self.driver.find_element_by_id("id_description")
        desc.send_keys("This is A1 corp")
        button = self.driver.find_element_by_tag_name("button")
        button.click()
        time.sleep(10)

    # Called after test ( standard features )
    def tearDown(self):
        self.driver.quit()'''


'''class MySeleniumTests(LiveServerTestCase):
    fixtures = ['client.yaml', 'user.yaml', 'salesperson.yaml', 'customer.yaml']

    @classmethod
    def setUpClass(cls):
        tenant = Client(domain_url='http://example.com:8000', schema_name='public', name='SaaS')
        tenant.save()  # migrate_schemas automatically called, your tenant is ready to be used!
        super(MySeleniumTests, cls).setUpClass()
        cls.selenium = WebDriver()

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super(MySeleniumTests, cls).tearDownClass()

    def test_login(self):
        self.selenium.get('http://example.com:8000')
        self.selenium.implicitly_wait(150)'''

