# -*- coding: utf-8 -*-#

from django.contrib.auth import views as auth_views
from django.views.generic import TemplateView
from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse_lazy

from registration.backends.default.views import ActivationView

from accounts.views import MyRegistrationView, tableUser, MyLogin, UserDeleteView
from crm.mixin import add_lang

__author__ = 'AMA'

# URLconfs have a hook that lets you pass extra arguments to your view FUNCTIONS (!), as a Python dictionary.
#   url(r'^blog/(?P<year>[0-9]{4})/$', views.year_archive, {'foo': 'bar'}),
#  for a request to /blog/2005/, Django will call views.year_archive(request, year='2005', foo='bar').


urlpatterns = [
    url(r'^register/$', MyRegistrationView.as_view(), name='register'),

    url(r'^register/complete/$', TemplateView.as_view(template_name='accounts/registration_complete.html'),
        name='registration_complete'),

    url(r'^login/$', MyLogin.as_view(), name='login'),
    url(r'^logout/$', login_required(add_lang(auth_views.logout)), {'template_name': 'accounts/logout.html'}, name='logout'),

    url(r'^userlist/$', tableUser, name='userlist'),
    url(r'^userlist/(?P<pk>[0-9]+)/$', UserDeleteView.as_view(), name='user_del'),

    url(r'^password/change/$', login_required(add_lang(auth_views.password_change)),
        {'post_change_redirect': reverse_lazy('auth_password_change_done'),
         'template_name': 'accounts/password_change_form.html'},name='auth_password_change'),

    url(r'^password/change/done/$', login_required(add_lang(auth_views.password_change_done)),
        {'template_name': 'accounts/password_change_done.html'}, name='auth_password_change_done'),

    url(r'^password/reset/$', login_required(add_lang(auth_views.password_reset)), {'template_name': 'accounts/password_reset_form.html',
        'post_reset_redirect': reverse_lazy('auth_password_reset_done')},name='auth_password_reset'),

    url(r'^password/reset/complete/$', login_required(add_lang(auth_views.password_reset_complete)),
        {'template_name': 'accounts/password_reset_complete.html'}, name='auth_password_reset_complete'),

    url(r'^password/reset/done/$', login_required(add_lang(auth_views.password_reset_done)),
        {'template_name': 'accounts/password_reset_done.html'},name='auth_password_reset_done'),

    url(r'^password/reset/confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>.+)/$',
        login_required(add_lang(auth_views.password_reset_confirm)),
        {'post_reset_redirect': reverse_lazy('auth_password_reset_complete')}, name='auth_password_reset_confirm'),

    url(r'^activate/(?P<activation_key>\w+)/$', ActivationView.as_view(),name='registration_activate'),

    url(r'^activate/complete/$', TemplateView.as_view(template_name='registration/activation_complete.html'),
        name='registration_activation_complete'),
]
