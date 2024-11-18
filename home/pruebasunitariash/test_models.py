from django.test import TestCase
from .models import Producto

class ProductoModelTest(TestCase):

    def setUp(self):
        
        self.producto = Producto.objects.create(
            nombre="Producto de prueba",
            descripcion="Descripción del producto de prueba",
            latitud=10.1234,
            longitud=-74.5678
        )

    def test_producto_creation(self):
       
        self.assertEqual(self.producto.nombre, "Producto de prueba")
        self.assertEqual(self.producto.descripcion, "Descripción del producto de prueba")
        self.assertEqual(self.producto.latitud, 10.1234)
        self.assertEqual(self.producto.longitud, -74.5678)

    def test_producto_str_representation(self):
        
        self.assertEqual(str(self.producto), "Producto de prueba")
