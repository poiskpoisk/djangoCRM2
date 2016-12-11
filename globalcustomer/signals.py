# -*- coding: utf-8 -*-#

from django.dispatch import receiver, Signal

from simpleCRM import settings

__author__ = 'AMA'

ChooseLang = Signal(providing_args=["lang"])


@receiver(ChooseLang)
def my_callback(sender, **kwargs):
    # receive language choice signal and set static variable
    settings.MY_LANG_CODE = kwargs['lang']
