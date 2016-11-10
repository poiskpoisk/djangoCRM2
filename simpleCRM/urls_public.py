from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin
from simpleCRM.settings import MEDIA_ROOT, MEDIA_URL
from .settings import DEBUG
import globalcustomer.urls

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', include(globalcustomer.urls)),
]

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)

if DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
