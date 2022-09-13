from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path,include
from rest_framework.routers import DefaultRouter
from product import views as productView
router=DefaultRouter()
router.register("collection",productView.CollectionViewSet,basename="collection")
router.register("products",productView.ProductViewSet,basename="products")
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include(router.urls)),
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
