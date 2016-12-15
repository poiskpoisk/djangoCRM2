from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from crm.models import Customer, SalesPerson, Todo, Deal, Product, DealProducts, DealStatus
from globalcustomer.models import Client
from guardian.admin import GuardedModelAdmin

# Customize admin panel
admin.AdminSite.index_title = _('simpleCRM, простая админка.')
admin.AdminSite.site_title = _('simpleCRM административная панель.')
admin.AdminSite.site_header = _('simpleCRM административная панель.')



class ContactAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'company', 'position', 'phone_number', 'sales_person')
    search_fields = ['first_name']

class TodoAdmin(admin.ModelAdmin):
    list_display = ('action', 'action_description', 'todo_data', 'todo_time', 'sales_person')
    list_filter = ['todo_data']


class SalesPersonAdmin(admin.ModelAdmin):
    pass


class DealAdmin(GuardedModelAdmin):
    list_display = ('ident', 'description', 'sales_person')
    list_filter = ['sales_person']


class ProductAdmin(admin.ModelAdmin):
    list_display = ('sku', 'description', 'price')


class DealProductsAdmin(admin.ModelAdmin):
    list_display = ('product', 'qty')


class DealStatusAdmin(admin.ModelAdmin):
    list_display = ('status',)

class GlobalCustomerAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Client._meta.fields if field.name != "id"]

admin.site.register(Client, GlobalCustomerAdmin)
admin.site.register(Customer, ContactAdmin)
admin.site.register(DealProducts, DealProductsAdmin)
admin.site.register(DealStatus, DealStatusAdmin)
admin.site.register(Todo, TodoAdmin)
admin.site.register(Deal, DealAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(SalesPerson, SalesPersonAdmin)

