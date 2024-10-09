# products/urls.py

from django.urls import path
from .views import ProductAPIView

urlpatterns = [
    path('api/scrapper/', ProductAPIView.as_view(), name='product-list'),
]
