from __future__ import unicode_literals

from django.db import models
from django.core.validators import RegexValidator
from django.utils.translation import ugettext as _


class Person(models.Model):                                                 # ABS class define abstract Person
    first_name   = models.CharField(max_length=30, verbose_name = _('Фамилия'),
                 help_text = _("Фамилия") )

    second_name  = models.CharField(max_length=30, verbose_name = _('Имя'), blank=True )
    # upload_to - URL относительно MEDIA_URL
    avatar       = models.ImageField(upload_to = 'crm/', blank=True )
    phone_number = models.CharField(max_length=15, verbose_name = _('Телефон'),
                                    validators=[RegexValidator(regex=r'^\+?1?\d{9,15}$',
                                    message="Phone number must be entered in the format: '+999999999'."
                                    " Up to 15 digits allowed.")], blank=True)   # validators should be a list
    email_address = models.EmailField(max_length=80, verbose_name = _('Эл.почта')) # EmaiField has validator'

    class Meta:
        abstract = True

class SalesPerson(Person):
    division = models.CharField(max_length=50, blank=True, verbose_name = _('Подразделение'))

    def __str__(self):
        return '%s %s' % (self.first_name, self.second_name)


class Todo(models.Model):
    ACTIONS_CHOICES = (
        ('E', 'Email'),
        ('C', 'Phone call'),
        ('O', 'Other'),
    )
    sales_person        = models.ForeignKey(SalesPerson, on_delete=models.CASCADE)  # Many-to-One relation
    action              = models.CharField(max_length=1, choices=ACTIONS_CHOICES)
    action_description  = models.TextField()
    data_time           = models.DateTimeField()

    def __str__(self):
        return '%s %s' % (self.action_description, self.data_time)


class Contact(Person):
    sales_person        = models.ForeignKey(SalesPerson, on_delete=models.CASCADE)  # Many-to-One relation
    company             = models.CharField(max_length=50, blank=True)
    position            = models.CharField(max_length=50, blank=True)
    mobile_phone_number = models.CharField(max_length=15, validators=[RegexValidator(regex=r'^\+?1?\d{9,15}$',
                                                               message="Phone number must be entered in the format:"
                                                                   " '+999999999'. Up to 15 digits allowed.")],
                                                                blank=True)   # validators should be a list
    email_address = models.EmailField(max_length=80, blank=True)              # EmaiField has validator
    brith_data          = models.DateField(blank=True, null=True)
    comment             = models.TextField(blank=True)

    def __str__(self):
        return '%s %s' % (self.first_name, self.second_name)


class Deal(models.Model):
    STATUS_CHOICES = (
        ('E', 'First contact'),
        ('D', 'Decision making'),
        ('H', 'Harmonization of contract'),
        ('S', 'The contract is signed'),
        ('P', 'Checkout paid'),
        ('E', 'Contract executed successfully'),
        ('A', 'DEAD DEAL'),
    )
    sales_person    = models.ForeignKey(SalesPerson, on_delete=models.CASCADE)  # Many-to-One relation
    description     = models.TextField(verbose_name = _('Описание'))
    status          = models.CharField(max_length=1, choices=STATUS_CHOICES)
    data_time       = models.DateTimeField(auto_now_add=True)

class Product(models.Model):
    sku         = models.ForeignKey(Deal, on_delete=models.CASCADE)  # Many-to-One relation
    description = models.TextField()
    price       = models.IntegerField(default=0)

    def __str__(self):
        return '%s %s' % (self.sku, self.description)
