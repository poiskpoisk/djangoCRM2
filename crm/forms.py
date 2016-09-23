from django import forms
from .models import SalesPerson

class SalesPersonForm(forms.ModelForm):

    class Meta:
        model = SalesPerson
        fields = ('first_name', 'second_name', 'avatar', 'phone_number', 'email_address', 'division' )