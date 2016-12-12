from django.db import models
from tenant_schemas.models import TenantMixin
from django.utils.translation import ugettext_lazy as _


class Client(TenantMixin):
    """
        Client model has two types of records: Public record and Tenants records.

        >>> # Load a fixture. It's some tricky for doctest.
        >>> from django.core.management import call_command
        >>> call_command("loaddata","client.yaml")
        Installed 2 object(s) from 1 fixture(s)
        >>> # Check for PUBLIC ( main record ) is present.
        >>> rec = Client.objects.get(pk=1)
        >>> print( rec.schema_name )
        public
        >>> # Check for TENANT is present.
        >>> rec = Client.objects.get(pk=2)
        >>> print( rec.schema_name )
        a1
    """
    LANG_CHOICES = (
        ('ru', _('Русский')),
        ('en', _('Английский')),
        ('cn', _('Китайский')),
    )

    name = models.CharField(_('Имя Вашей организации'), max_length=100)
    description = models.TextField(_("Пару слов о Вашей организации"), max_length=200, blank=True)
    created_on = models.DateField(auto_now_add=True)
    lang = models.CharField(_('Язык'), max_length=2, choices=LANG_CHOICES )

    class Meta:
        verbose_name = _('Организация')
        verbose_name_plural = _('Все организации')

