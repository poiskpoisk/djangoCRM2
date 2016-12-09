from django.conf.urls import url, include, patterns
from django.conf.urls.i18n import i18n_patterns
from django.conf.urls.static import static
from django.contrib import admin
from django.views.i18n import set_language

from crm.views.views import setLang
from simpleCRM.settings import MEDIA_ROOT, MEDIA_URL
from .settings import DEBUG
import globalcustomer.urls

urlpatterns = [
    url(r'^setlang/$', set_language, name='set_language'),
]

urlpatterns += i18n_patterns(
    url(r'^lang/', setLang, name='set_language'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', include(globalcustomer.urls)),
)

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)

if DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
