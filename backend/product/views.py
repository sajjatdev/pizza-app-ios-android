from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.pagination import PageNumberPagination
from .API import CollectionSerializer,ProductSerializer
from .models import Collection,Product

class CollectionViewSet(ModelViewSet):
               pagination_class=PageNumberPagination
               queryset=Collection.objects.all()
               serializer_class=CollectionSerializer



class ProductViewSet(ModelViewSet):
               queryset=Product.objects.all()
               serializer_class=ProductSerializer