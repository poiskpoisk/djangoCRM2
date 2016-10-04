# Only registration,login etc views

from django.contrib.auth.views import login as loginView
from registration.backends.default.views import RegistrationView


# Внимание в django.contrib.auth.views и django.contrib.auth находятся ДВА !!!! разных логина
def myLogin( *args, **kwargs ):

    res = loginView( *args, **kwargs )

    icons = ['fa fa-user fa', 'fa fa-lock fa-lg' ]

    try:
        form = res.context_data['form']
    except:
        pass
    else:
        for field, icon in zip(form, icons):
            field.logo = icon

        res.context_data['form'] = form
    finally:
        return res

# New user registration
class MyRegistrationView(RegistrationView):

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super().get_context_data(**kwargs)
        # Add cusom context

        # Сцепляем два списка с полями для вывода и графическими значками
        icons = ['fa fa-user fa', 'fa fa-envelope fa', 'fa fa-lock fa-lg', 'fa fa-lock fa-lg']
        try:
            form = context['form']
        except:
            pass
        else:
            for field, icon in zip(form, icons):
                field.logo = icon

            context['form']=form
        finally:
            return context

    def get_success_url(self, user=None):
        return '/accounts/register/complete/'