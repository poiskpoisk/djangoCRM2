from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic import DeleteView
from django.views.generic import TemplateView
from django_tables2 import RequestConfig
from django.contrib.auth import views as auth_views, logout
from django.utils.translation import ugettext as _
from django.contrib import messages
from django.db.models import F
from django.utils.decorators import method_decorator

from registration.backends.default.views import RegistrationView

from accounts.forms import MyRegistrationFormUniqueEmail, MyAuthenticationForm
from accounts.tables import UserListTable
from crm.mixin import SomeUtilsMixin
from crm.models import SalesPerson
from guardian.decorators import permission_required


class MyRegistrationView(RegistrationView):
    form_class = MyRegistrationFormUniqueEmail
    template_name = 'accounts/registration_form.html'

    def get_success_url(self):
        return reverse('registration_complete')


@login_required
@permission_required('auth.add_user', accept_global_perms=True)
def tableUser(request):
    # add somme data from related tables
    queryset = User.objects.annotate(sp=F('salesperson__role'))
    queryset = queryset.annotate(user=F('salesperson__first_name'))

    for q in queryset:
        # convert one symbol name to people friendly value
        for choice in SalesPerson.ROLE_CHOICES:
            if q.sp == choice[0]:
                q.sp = choice[1]

    table = UserListTable(queryset)
    RequestConfig(request).configure(table)
    filter = 'NONFILTER'
    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})

class UserDeleteView(DeleteView):
    model = User
    template_name = 'accounts/user_del.html'

    def get_success_url(self):
        return reverse('userlist')

    @method_decorator(login_required())
    @method_decorator(permission_required('auth.delete_user', accept_global_perms=True))
    def get(self, request, *args, **kwargs):
        return super().get(self, request, *args, **kwargs)

class MyLogin(TemplateView, SomeUtilsMixin):
    template_name = 'accounts/login.html'

    def post(self, request, *args, **kwargs):
        resp = auth_views.login(request, template_name='accounts/login.html', authentication_form=MyAuthenticationForm)
        if not request.user.groups.filter(name='admin').exists() and str(request.user) != 'AnonymousUser':
            try:
                sp = SalesPerson.objects.get(user=request.user)
            except:
                messages.error(request, _("Учетная запись пользователя должна быть связанна с записью персонала"
                                          " или иметь статус АДМИНИСТРАТОРА."))
                logout(request)
                return HttpResponseRedirect(reverse('login'))


        return resp

    def get(self, request, *args, **kwargs):
        # if the forma updated we need to clear message query
        self.clearMsg( request )
        resp=auth_views.login(request, template_name='accounts/login.html', authentication_form=MyAuthenticationForm)
        return resp

