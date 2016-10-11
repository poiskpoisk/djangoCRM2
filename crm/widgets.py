# -*- coding: utf-8 -*-#
__author__ = 'AMA'

from django.forms import widgets, ClearableFileInput
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext as _


class imageWidget(ClearableFileInput):

    initial_text            = _(u'Сейчас')
    clear_checkbox_label    = _(u'Очистить выбор фотографии')
    input_text              = _(u'Изменить фотографию')

    template_with_initial = (
        '<div class="row"> <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-1 col-xs-6">'
        '<img src="%(initial_url)s"  height="150" width="150" class="img-circle img-responsive user_image" ></div>'
        '<a class="btn btn-default btn-sm" data-toggle="collapse" data-target="#hide-me" href="#">%(input_text)s: </a></div>'
        '<div id="hide-me" class="collapse out">%(clear_template)s<br/>%(input_text)s: %(input)s</div>'
    )

class faWidget( widgets.TextInput):

    def __init__(self, fa, **kwargs ):
        self.fa = fa
        super().__init__( **kwargs )

    def render(self, name, value, attrs=None):
        html = super().render( name, value, attrs)
        new_html = '''<div class="cols-sm-10 input-group"><span class="input-group-addon"><i class="'''+self.fa+'''" aria-hidden="true"></i></span>'''+ html + '''</div>'''
        return mark_safe(new_html)







