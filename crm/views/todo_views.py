# -*- coding: utf-8 -*-#
from django.contrib.auth.decorators import permission_required
from django.utils import translation
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DeleteView
from django.core.urlresolvers import reverse
from django.views.generic import UpdateView

from crm.forms import ToDoForm
from crm.models import Todo

__author__ = 'AMA'


class ToDoDeleteView(DeleteView):
    model = Todo
    form_class = ToDoForm
    template_name = 'crm/todo_del.html'

    def get_success_url(self):
        return reverse('todos')

    @method_decorator(permission_required('crm.delete_todo'))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)


class ToDoUpdateView(UpdateView):
    model = Todo
    form_class = ToDoForm
    template_name = 'crm/todo.html'

    def get_success_url(self):
        return reverse('todopage', kwargs={'pk': self.kwargs['pk']})

    @method_decorator(permission_required('crm.change_todo'))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)

    @method_decorator(permission_required('crm.change_todo'))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)


class ToDoCreateView(CreateView):
    model = Todo
    template_name = 'crm/todo_new.html'
    form_class = ToDoForm

    def get_success_url(self):
        return reverse('todos')

    @method_decorator(permission_required('crm.add_todo'))
    def get(self, request, *args, **kwargs):
        translation.activate(request.user.salesperson.lang)
        return super().get(self, request, *args, **kwargs)

    @method_decorator(permission_required('crm.add_todo'))
    def post(self, request, *args, **kwargs):
        return super().post(self, request, *args, **kwargs)