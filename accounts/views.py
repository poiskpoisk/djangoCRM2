from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.shortcuts import render
from django_tables2 import RequestConfig
from registration.backends.default.views import RegistrationView

from accounts.forms import MyRegistrationFormUniqueEmail
from accounts.tables import UserListTable


class MyRegistrationView(RegistrationView):
    form_class = MyRegistrationFormUniqueEmail
    template_name = 'accounts/registration_form.html'

    def get_success_url(self):
        return reverse('registration_complete')


@login_required
def tableUser(request):
    queryset = User.objects.all()
    table = UserListTable(queryset)
    RequestConfig(request).configure(table)
    filter = 'NONFILTER'
    return render(request, 'crm/common_table_list.html', {'table': table, 'filter': filter})
