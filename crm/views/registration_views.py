# Only registration,login etc views

from registration.backends.default.views import RegistrationView
from django.views.generic.list import ListView
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse


# New user registration
class MyRegistrationView(RegistrationView):

    def get_success_url(self, user=None):
        return reverse('registration_complete')

class UserListView(ListView):
    model = User
    paginate_by = 20