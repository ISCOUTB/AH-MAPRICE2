from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User
from .models import Producto

class HomeViewTest(TestCase):

    def setUp(self):
        
        self.user = User.objects.create_user(username="testuser", password="12345")
        
        
        Producto.objects.create(nombre="Producto 1", descripcion="Descripción 1", latitud=10.1234, longitud=-74.5678)
        Producto.objects.create(nombre="Producto 2", descripcion="Descripción 2", latitud=10.5678, longitud=-75.1234)

    def test_home_view_redirects_if_not_logged_in(self):
       
        response = self.client.get(reverse('home'))
        self.assertRedirects(response, '/accounts/login/?next=/home/')

    def test_home_view_logged_in(self):
       
        self.client.login(username='testuser', password='12345')
        response = self.client.get(reverse('home'))

        
        self.assertEqual(response.status_code, 200)

       
        self.assertIn('productos', response.context)
        self.assertEqual(len(response.context['productos']), 2)
