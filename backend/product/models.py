from django.db import models



class Collection(models.Model):
               name=models.CharField(max_length=255)
               image=models.ImageField(upload_to='collection')
               create_at=models.DateTimeField(auto_now_add=True)
               def __str__(self):
                              return self.name

               class Meta:
                              db_table = 'collection'
                              managed = True
                              verbose_name = 'Collection'
                              verbose_name_plural = 'Collections'


class Product(models.Model):
               collection=models.ForeignKey(Collection,on_delete=models.CASCADE,related_name="collection")
               name=models.CharField(max_length=255)
               image=models.ImageField(upload_to='product')
               size=models.DecimalField(max_digits=6,decimal_places=2)
               price=models.DecimalField(max_digits=6,decimal_places=2)
               create_at=models.DateTimeField(auto_now_add=True)
               def __str__(self):
                              return self.name

               class Meta:
                              db_table = 'product'
                              managed = True
                              verbose_name = 'Product'
                              verbose_name_plural = 'Products'