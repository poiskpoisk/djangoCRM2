# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.forms import widgets
from django.utils.safestring import mark_safe


class userWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)


class usersWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)

class phoneWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-phone fa-lg" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)

class mobilePhoneWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-mobile fa-lg" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)


class passwordWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)

class emailWidget( widgets.TextInput):
    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)




