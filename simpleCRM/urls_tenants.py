"""simpleCRM URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import login as loginView
from django.views.generic import TemplateView
from django.contrib import admin

from crm.registration_forms import MyRegistrationFormUniqueEmail, MyAuthenticationForm
from crm.views.registration_views import MyRegistrationView, UserListView
from simpleCRM.settings import MEDIA_ROOT, MEDIA_URL
from .settings import DEBUG

urlpatterns = [
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'^crm/', include('crm.urls')),
    url(r'^select2/', include('django_select2.urls')),
    url(r'^accounts/', include('registration.backends.default.urls')),
]

# URLconfs have a hook that lets you pass extra arguments to your view FUNCTIONS (!), as a Python dictionary.
#   url(r'^blog/(?P<year>[0-9]{4})/$', views.year_archive, {'foo': 'bar'}),
#  for a request to /blog/2005/, Django will call views.year_archive(request, year='2005', foo='bar').

urlpatterns += [
    url(r'^$', loginView, {'authentication_form': MyAuthenticationForm}, name='mainpage'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/register/$', MyRegistrationView.as_view(form_class=MyRegistrationFormUniqueEmail), name='register'),
    url(r'^accounts/register/complete/$', TemplateView.as_view(template_name='registration/registration_complete.html'),
        name='registration_complete'),
    url(r'^accounts/login/$', loginView, {'authentication_form': MyAuthenticationForm}, name='login'),
    url(r'^accounts/logout/$', auth_views.logout, {'template_name': 'registration/logout.html'}, name='logout'),
    url(r'^accounts/userlist/$', login_required(UserListView.as_view(template_name='registration/userlist.html')),
        name='userlist'),
]

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)

if DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
