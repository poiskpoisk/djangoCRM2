# -*- coding: utf-8 -*-#

from django.contrib import messages

__author__ = 'AMA'

# If we don't clear storage of message's that old message's showed
class ClearMsg():

    def clearMsg(self, request):
        storage = messages.get_messages(request)
        for msg in storage:
            try:
                del msg._loaded_messages
            except:
                pass