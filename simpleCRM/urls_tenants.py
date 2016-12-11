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
from django.conf.urls.i18n import i18n_patterns
from django.conf.urls.static import static
from django.contrib import admin

from django.shortcuts import redirect
from django.core.urlresolvers import reverse, reverse_lazy
from django.views.generic import RedirectView
from django.views.i18n import set_language

from crm.views.views import setLang
from simpleCRM.settings import MEDIA_ROOT, MEDIA_URL
from .settings import DEBUG

urlpatterns = [ url(r'^lang/', setLang, name='sl'),]

urlpatterns += [
    url(r'^crm/', include('crm.urls')),
    url(r'^select2/', include('django_select2.urls')),
    url(r'^accounts/', include('accounts.urls')),
    url(r'^$', RedirectView.as_view(url=reverse_lazy('login'), permanent=False), name='mainpage'),
    url(r'^admin/', include(admin.site.urls)),
]

# URLconfs have a hook that lets you pass extra arguments to your view FUNCTIONS (!), as a Python dictionary.
#   url(r'^blog/(?P<year>[0-9]{4})/$', views.year_archive, {'foo': 'bar'}),
#  for a request to /blog/2005/, Django will call views.year_archive(request, year='2005', foo='bar').

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)

if DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
