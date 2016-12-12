# -*- coding: utf-8 -*-#

from django.contrib import messages
from django.contrib.auth.models import User
from django.utils import translation
from django.utils.translation import ugettext_lazy as _

from crm.models import DealStatus

__author__ = 'AMA'


# The decorator, than choose a language in dependence from a user preferred language
def add_lang(view):
    def f(request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return view(request, *args, **kwargs)
    return f


# It's only set of useful utils for CRUD classes
class SomeUtilsMixin():
    # If we don't clear storage of message's that old message's showed
    def clearMsg(self, request):
        storage = messages.get_messages(request)
        for msg in storage:
            try:
                del msg._loaded_messages
            except:
                pass

    # Check permissions for model and object both
    def checkPermissions(self, request, model, perm):
        rec = model.objects.get(pk=self.kwargs['pk'])
        user = User.objects.get(username=str(request.user))
        has_perm = user.has_perm(perm, rec)
        has_perm_group = user.has_perm(perm)
        if not has_perm and not has_perm_group:
            messages.error(request, _(' У Вашего аккаунта не хватает прав для совершения этой операции'))
            return False
        else:
            return True

    # Change jne letter code on hunan readable text
    def doHumanReadble_STATUS_CHOICES(self, queryset):
        for query in queryset:
            for status in DealStatus.STATUS_CHOICES:
                if query.deal_status == status[0]:
                    query.deal_status = status[1]
        return queryset
