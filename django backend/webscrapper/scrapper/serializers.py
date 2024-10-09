# products/serializers.py

from rest_framework import serializers

class ProductSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=100)
    price = serializers.CharField(max_length=10)
    location = serializers.CharField(max_length=100)
