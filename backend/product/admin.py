from django.contrib import admin
from .models import Product,Collection
# Register your models here.

@admin.register(Collection)
class CollectionAdmin(admin.ModelAdmin):
               pass

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
               pass
