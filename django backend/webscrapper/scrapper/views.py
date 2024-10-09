# products/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ProductSerializer
from django.http import JsonResponse

class ProductAPIView(APIView):
    # Simulación de productos como datos de prueba
    products = [
        {'name': 'Harina de trigo', 'price': '$1000', 'location': (10.3892, -75.4789)},
        {'name': 'Arroz', 'price': '$2000', 'location': (10.3910, -75.4795)},
        {'name': 'Aceite', 'price': '$2500', 'location': (10.3920, -75.4770)},
        {'name': 'Leche', 'price': '$1500', 'location': (10.3885, -75.4820)},
        {'name': 'Huevos', 'price': '$3000', 'location': (10.3900, -75.4815)},
        {'name': 'Frijoles', 'price': '$1800', 'location': (10.3870, -75.4790)},
        {'name': 'Zanahorias', 'price': '$1200', 'location': (10.3905, -75.4805)},
        {'name': 'Cebolla', 'price': '$1000', 'location': (10.3915, -75.4780)},
        {'name': 'Tomate', 'price': '$1300', 'location': (10.3898, -75.4775)},
        {'name': 'Papas', 'price': '$1100', 'location': (10.3925, -75.4825)},
        {'name': 'Pasta', 'price': '$900', 'location': (10.3902, -75.4808)},
        {'name': 'Sal', 'price': '$500', 'location': (10.3880, -75.4792)},
        {'name': 'Azúcar', 'price': '$1300', 'location': (10.3930, -75.4810)},
        {'name': 'Atún', 'price': '$2500', 'location': (10.3940, -75.4788)},
        {'name': 'Pan', 'price': '$2000', 'location': (10.3908, -75.4820)},
    ]


    def get(self, request):
        product_name = request.query_params.get('name', '').lower()
        filtered_products = [product for product in self.products if product_name in product['name'].lower()]

        serializer = ProductSerializer(filtered_products, many=True)
        return Response(serializer.data)

# Simulación de productos
def product_data(request):
    products = [
        {'name': 'Harina de trigo', 'price': '$1000', 'location': [10.3892, -75.4789]},
        {'name': 'Arroz', 'price': '$2000', 'location': [10.3910, -75.4795]},
        {'name': 'Aceite', 'price': '$2500', 'location': [10.3920, -75.4770]},
        {'name': 'Leche', 'price': '$1500', 'location': [10.3885, -75.4820]},
        {'name': 'Huevos', 'price': '$3000', 'location': [10.3900, -75.4815]},
        {'name': 'Frijoles', 'price': '$1800', 'location': [10.3870, -75.4790]},
        {'name': 'Zanahorias', 'price': '$1200', 'location': [10.3905, -75.4805]},
        {'name': 'Cebolla', 'price': '$1000', 'location': [10.3915, -75.4780]},
        {'name': 'Tomate', 'price': '$1300', 'location': [10.3898, -75.4775]},
        {'name': 'Papas', 'price': '$1100', 'location': [10.3925, -75.4825]},
        {'name': 'Pasta', 'price': '$900', 'location': [10.3902, -75.4808]},
        {'name': 'Sal', 'price': '$500', 'location': [10.3880, -75.4792]},
        {'name': 'Azúcar', 'price': '$1300', 'location': [10.3930, -75.4810]},
        {'name': 'Atún', 'price': '$2500', 'location': [10.3940, -75.4788]},
        {'name': 'Pan', 'price': '$2000', 'location': [10.3908, -75.4820]},
    ]
    return JsonResponse(products, safe=False)