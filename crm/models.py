from django.db import models
from django.core.validators import RegexValidator, MinValueValidator
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import ugettext as __
from decimal import Decimal

# how to override the verbose name of a superclass model field in django
# http://stackoverflow.com/questions/927729/how-to-override-the-verbose-name-of-a-superclass-model-field-in-django
User._meta.get_field('is_staff').verbose_name = _('персонал')
User._meta.get_field('is_superuser').verbose_name = _('админ.')

class Person(models.Model):  # ABS class define abstract Person

    first_name = models.CharField(max_length=100, verbose_name=_('Фамилия'))
    second_name = models.CharField(max_length=100, verbose_name=_('Имя'))

    phone_number = models.CharField(max_length=20, verbose_name=_('Телефон'),
                                    validators=[RegexValidator(regex=r'^(\+\d{1,2,3}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$',
                                    message=_("Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899"))],
                                    blank=True)  # validators should be a list
    mobile_number = models.CharField(max_length=20, verbose_name=_('Мобильный телефон'),
                                     validators=[RegexValidator(regex=r'^(\+\d{1,2,3}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$',
                                     message=_("Телефонный номер до 10 цифр. (123) 456 7899 или (123)-456-7899 или 123 456 7899"))],
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

    ROLE_CHOICES = (
        ('B', _('Руководитель')),
        ('A', _('Администратор')),
        ('M', _('Менеджер')),
    )

    LANG_CHOICES = (
        ('ru', _('Русский')),
        ('en', _('Английский')),
        ('cn', _('Китайский')),
    )
    # see http://djbook.ru/rel1.8/topics/auth/customizing.html
    user = models.OneToOneField(User, on_delete=models.CASCADE,
                                verbose_name=_('Логин'))  # Связываем модель с данными USER ( РАСШИРЯЕМ USER )

    division = models.CharField(max_length=50, blank=True, verbose_name=_('Подразделение'))
    lang = models.CharField(_('Язык'), max_length=2, choices=LANG_CHOICES)
    role = models.CharField(max_length=1, choices=ROLE_CHOICES, verbose_name=_('Роль'),
                        help_text=_('По соображениям безопасности роль можно назначить только при создании нвого менеджера по продажам. '
                                  'Если понадобится изменить роль, то надо удалить менеджера по продажам и'
                                  'связаный с ним пользовательский аккаунт и создать нового с требуемой ролью.'))

    class Meta:
        verbose_name = _('Менеджер по продажам')
        verbose_name_plural = _('Всего менеджеров по продажам')
        permissions = (('read_salesperson', _('Просмотр менеджера по продажам')),)

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
    sales_person = models.ForeignKey(SalesPerson, on_delete=models.CASCADE,
                                     verbose_name=_('Менеджер'))  # Many-to-One relation

    action = models.CharField(max_length=1, choices=ACTIONS_CHOICES, verbose_name=_('Действие'))
    action_description = models.TextField(_('Комментарий'))
    todo_data = models.DateField(_('Дата'))
    todo_time = models.TimeField(_('Время'))

    class Meta:
        verbose_name = _('Список дел')
        verbose_name_plural = _('Всего дел')
        permissions = (('read_todo', _('Просмотр дел')),)

    def __str__(self):
        return '%s' % (self.action_description)


class Customer(Person):
    STATUS_CHOICES = (
        ('C', _('Делал покупку')),
        ('V', _('VIP')),
        ('I', _('Интересовался покупкой')),
        ('N', _('Негативно настроен')),
        ('O', _('Что-то еще')),
    )
    sales_person = models.ForeignKey(SalesPerson, on_delete=models.CASCADE,
                                     verbose_name=_('Менеджер'))  # Many-to-One relation

    company = models.CharField(max_length=50, blank=True, verbose_name=_('Компания'))
    position = models.CharField(max_length=50, blank=True, verbose_name=_('Должность'))
    email_address = models.EmailField(max_length=80, blank=True, verbose_name=_('Эл.почта'))  # EmaiField has validator
    brith_data = models.DateField(blank=True, null=True, verbose_name=_('Дата рождения'))
    status = models.CharField(max_length=1, choices=STATUS_CHOICES, verbose_name=_('Статус'))
    comment = models.TextField(blank=True, verbose_name=_('Комментарий'))

    class Meta:
        verbose_name = _('Клиент')
        verbose_name_plural = _('Всего клиентов')
        permissions = (('read_customer', _('Просмотр пользоателей')),)


    def __str__(self):
        return '%s %s' % (self.first_name, self.second_name)


class Deal(models.Model):

    sales_person = models.ForeignKey(SalesPerson, verbose_name=_('Менеджер'))  # Many-to-One relation
    customer = models.ForeignKey(Customer, blank=True, null=True,verbose_name=_('Клиент'))  # Many-to-One relation
    products = models.ManyToManyField('Product', through='DealProducts',
                                      verbose_name=_('Список продуктов'))  # Many-to-Many с промежуточной моделью

    price = models.DecimalField(_('Цена всего'), max_digits=12, decimal_places=2, default=0,  blank=True,
                                help_text=_('<h5><small>Стоимость контракта будет вычисленна автоматически</h5></small>'),
                                validators=[MinValueValidator(Decimal('0.00'), )])
    ident = models.PositiveIntegerField(_('Номер контракта'), unique=True)
    description = models.TextField(verbose_name=_('Описание'))

    class Meta:
        verbose_name = _('Сделка')
        verbose_name_plural = _('Всего сделок')
        permissions = ( ('read_deal', _('Просмотр контрактов')),)

    def __str__(self):
        return '%s' % (self.ident)


class Product(models.Model):
    sku = models.IntegerField(_('Номер товара'), unique=True)
    description = models.TextField(_('Наименование товара'), unique=True)
    price = models.PositiveIntegerField(_('Цена'),default=0)

    class Meta:
        verbose_name = _('Продукт')
        verbose_name_plural = _('Всего продуктов')
        permissions = (('read_product', _('Просмотр продуктов')),)

    def __str__(self):
        return '%s' % (self.description)


class DealProducts(models.Model):  # Промежуточная модель

    deal = models.ForeignKey(Deal, on_delete=models.CASCADE, blank=True, null=True,
                             verbose_name=_('Контракт'))  # Many-to-One relation
    product = models.ForeignKey(Product, on_delete=models.CASCADE, blank=True, null=True,
                                verbose_name=_('Продукт'))  # Many-to-One relation

    qty = models.PositiveIntegerField(_('Количество товара'), null=True, blank=True, default=0)
    hlp = _('<h5><small>Если эту строку оставить пустой, он вычислится автоматически при сохранении формы </h5></small>')
    item_price = models.PositiveIntegerField(_('Цена за штуку'), null=True, blank=True, default=0, help_text=_(hlp))
    total_price = models.PositiveIntegerField(_('Цена за все'), null=True, blank=True, default=0, help_text=_(hlp))

    class Meta:
        # auto_created = True
        verbose_name = _('Продукт в контракте')
        verbose_name_plural = _('Всего продуктов в контракте')
        permissions = (('read_salesperson', _('Просмотр продуктов в контракте')),)

    def __str__(self):
        return '%s' % (self.product)


class DealStatus(models.Model):

    STATUS_CHOICES = (
        ('E', _('Первый контакт')),
        ('D', _('Принятие решения')),
        ('H', _('Согласование контракта')),
        ('S', _('Контракт подписан')),
        ('P', _('Ожидание денег')),
        ('O', _('Контракт выполнен')),
        ('A', _('Мертвый контракт')),
    )

    deal = models.ForeignKey(Deal, on_delete=models.CASCADE, blank=True, null=True,
                             verbose_name=_('Контракт'))  # Many-to-One relation

    status = models.CharField(max_length=1, choices=STATUS_CHOICES, verbose_name=_('Статус'))
    deal_data = models.DateField(verbose_name=_('Дата'))
    deal_time = models.TimeField(verbose_name=_('Время'))
    remark = models.CharField(_('Примечание'), max_length=100,  blank=True,)

    class Meta:
        verbose_name = _('Статус контракта')
        verbose_name_plural = _('Статусы контракта')
        unique_together = (("deal","deal_data", "deal_time"),)
        permissions = (('read_salesperson', _('Просмотр статуса контракта')),)


    def __str__(self):
        return '%s' % (self.status)
