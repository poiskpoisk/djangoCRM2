# -*- coding: utf-8 -*-#

from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from django.views.generic import TemplateView
from django.conf.urls import url, include

from accounts.forms import MyAuthenticationForm
from accounts.views import MyRegistrationView, tableUser
from accounts.tables import UserListTable

__author__ = 'AMA'


# URLconfs have a hook that lets you pass extra arguments to your view FUNCTIONS (!), as a Python dictionary.
#   url(r'^blog/(?P<year>[0-9]{4})/$', views.year_archive, {'foo': 'bar'}),
#  for a request to /blog/2005/, Django will call views.year_archive(request, year='2005', foo='bar').


urlpatterns = [
    url(r'^register/$', MyRegistrationView.as_view(), name='register'),
    url(r'^register/complete/$', TemplateView.as_view(template_name='registration/registration_complete.html'),
        name='registration_complete'),
    url(r'^login/$', auth_views.login, {'template_name': 'accounts/login.html',
                                        'authentication_form': MyAuthenticationForm }, name='login'),
    url(r'^logout/$', auth_views.logout, {'template_name': 'accounts/logout.html'}, name='logout'),
    url(r'^userlist/$', tableUser, name='userlist'),
]