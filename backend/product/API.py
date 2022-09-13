from dataclasses import field
from pyexpat import model
from rest_framework import serializers
from .models import Collection,Product



class CollectionSerializer(serializers.ModelSerializer):

               class Meta:
                              model=Collection
                              fields='__all__'


class ProductSerializer(serializers.ModelSerializer):

               class Meta:
                              model=Product
                              fields="__all__"