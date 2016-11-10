from django.db import models
from tenant_schemas.models import TenantMixin
from django.utils.translation import ugettext as _


class Client(TenantMixin):
    name = models.CharField(_('Имя Вашей организации'), max_length=100)
    description = models.TextField(_("Парру слов о Вашей организации"), max_length=200, blank=True)
    created_on = models.DateField(auto_now_add=True)

    class Meta:
        verbose_name = _('Организация')
        verbose_name_plural = _('Все организации')

