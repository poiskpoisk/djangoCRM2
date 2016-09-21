from django.contrib import admin

from .models import Contact, SalesPerson, Todo, Deal, Product

# Customize admin panel
admin.AdminSite.index_title = u'simpleCRM, simple administration.'
admin.AdminSite.site_title  = u'simpleCRM administration.'
admin.AdminSite.site_header = u'simpleCRM administration.'


class DealInline(admin.TabularInline):
    model = Deal
    extra = 1

class ContactAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'company', 'position', 'phone_number', 'sales_person')
    search_fields = ['first_name']

class TodoAdmin(admin.ModelAdmin):
    list_display  = ('action', 'action_description', 'data_time', 'sales_person')
    list_filter   = ['data_time']

class SalesPersonAdmin(admin.ModelAdmin):
    list_display  = ('first_name', 'second_name', 'phone_number')
    inlines = [DealInline]
    search_fields = ['first_name']

class DealAdmin(admin.ModelAdmin):
    list_display    = ('status', 'description', 'data_time', 'sales_person')
    list_filter     = ['sales_person', 'data_time']

class ProductAdmin(admin.ModelAdmin):
    list_display = ('sku', 'description', 'price')

admin.site.register(SalesPerson, SalesPersonAdmin)
admin.site.register(Contact, ContactAdmin)
admin.site.register(Todo, TodoAdmin)
admin.site.register(Deal, DealAdmin )
admin.site.register(Product, ProductAdmin )

