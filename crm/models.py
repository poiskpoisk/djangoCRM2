from django.db import models
from django.core.validators import RegexValidator
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _


class Person(models.Model):                                                 # ABS class define abstract Person

    first_name  = models.CharField(max_length=100, verbose_name = _('Фамилия'))
    second_name = models.CharField(max_length=100, verbose_name=_('Имя'))

    phone_number = models.CharField(max_length=15, verbose_name = _('Телефон'),
                                    validators=[RegexValidator(regex=r'^\+?1?\d{9,15}$',
                                    message=_("Телефонный номер должен быть в формате: '+999999999. До 15 цифр."))],
                                    blank=True)  # validators should be a list
    mobile_number = models.CharField(max_length=15, verbose_name=_('Мобильный телефон'),
                                    validators=[RegexValidator(regex=r'^\+?1?\d{9,15}$',
                                    message=_("Телефонный номер должен быть в формате: '+999999999. До 15 цифр."))],
                                    blank=True)  # validators should be a list
    # upload_to - URL относительно MEDIA_URL
    avatar = models.ImageField(upload_to='crm/', blank=True, verbose_name=_('Фотография'))

    class Meta:
        abstract = True

'''
В Django есть четыре способа изменить модель User:

 1. proxy, только позволяет добавлять новые методы к User, изменяя ее поведение
 2. Связать User с пользовательской моделью, через соотношение OneToOne
 3. Образовать свой класс от AbstractUser и добваить новые атрибуты ( поля )
 4. Полностью создать свой новый класс, переопределив требуемые методы

 3 и 4 требуют переписания всех стандартных форм и будут скорее всего не совместимы с другими приложениями.
 Рекомендованный способ 2, хотя он и будет несколько медленнее работать.

'''

class SalesPerson(Person):
    # see http://djbook.ru/rel1.8/topics/auth/customizing.html
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name = _('Логин') ) # Связываем модель с данными стандартного USER
    division = models.CharField(max_length=50, blank=True, verbose_name = _('Подразделение'))

    class Meta:
        verbose_name = _('Менеджер по продажам')
        verbose_name_plural =  _('Всего менеджеров по продажам')

    def __str__(self):
        return '%s %s' % (self.first_name, self.second_name)


class Todo(models.Model):
    ACTIONS_CHOICES = (
        ('E', _('Электронная почта')),
        ('P', _('Телефонный звонок')),
        ('L', _('Личная встреча')),
        ('S', _('Почта бумажная')),
        ('O', _('Что-то еще')),
    )
    sales_person        = models.ForeignKey(SalesPerson, on_delete=models.CASCADE, verbose_name = _('Менеджер'))  # Many-to-One relation
    action              = models.CharField(max_length=1, choices=ACTIONS_CHOICES, verbose_name = _('Действие'))
    action_description  = models.TextField(verbose_name = _('Комментарий'))
    data_time           = models.DateTimeField(verbose_name = _('Дата и время'))

    class Meta:
        verbose_name = _('Список дел')
        verbose_name_plural =  _('Всего дел')

    def __str__(self):
        return '%s %s' % (self.action_description, self.data_time)


class Customer(Person):
    STATUS_CHOICES = (
        ('C', _('Делал покупку')),
        ('V', _('VIP')),
        ('I', _('Интересовался покупкой')),
        ('N', _('Негативно настроен')),
        ('O', _('Что-то еще')),
    )
    sales_person        = models.ForeignKey(SalesPerson, on_delete=models.CASCADE, verbose_name = _('Менеджер'))  # Many-to-One relation
    company             = models.CharField(max_length=50, blank=True, verbose_name = _('Компания'))
    position            = models.CharField(max_length=50, blank=True, verbose_name = _('Должность'))
    email_address       = models.EmailField(max_length=80,  blank=True, verbose_name=_('Эл.почта') )  # EmaiField has validator
    brith_data          = models.DateField(blank=True, null=True, verbose_name=_('Дата рождения'))
    status              = models.CharField(max_length=1, choices=STATUS_CHOICES, verbose_name = _('Статус'))
    comment             = models.TextField(blank=True, verbose_name=_('Комментарий'))

    class Meta:
        verbose_name = _('Клиент')
        verbose_name_plural =  _('Всего клиентов')

    def __str__(self):
        return '%s %s' % (self.first_name, self.second_name)


class Deal(models.Model):
    STATUS_CHOICES = (
        ('E', _('Первый контакт')),
        ('D', _('Принятие решения')),
        ('H', _('Согласование контракта')),
        ('S', _('Контракт подписан')),
        ('P', _('Ожидание денег')),
        ('E', _('Контракт выполнен успешно')),
        ('A', _('Мертвый контракт')),
    )
    sales_person    = models.ForeignKey(SalesPerson, on_delete=models.CASCADE, verbose_name = _('Менеджер'))  # Many-to-One relation
    description     = models.TextField(verbose_name = _('Описание'))
    status          = models.CharField(max_length=1, choices=STATUS_CHOICES, verbose_name = _('Статус'))
    data_time       = models.DateTimeField(auto_now_add=True, verbose_name = _('Дата и время'))

    class Meta:
        verbose_name = _('Сделка')
        verbose_name_plural = _('Всего сделок')

    def __str__(self):
        return '%s %s' % (self.data_time, self.description)


class Product(models.Model):
    sku         = models.ForeignKey(Deal, on_delete=models.CASCADE)  # Many-to-One relation
    description = models.TextField()
    price       = models.IntegerField(default=0)

    def __str__(self):
        return '%s %s' % (self.sku, self.description)
