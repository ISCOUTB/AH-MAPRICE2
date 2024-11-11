# ubicaciones/models.py
from django.db import models

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    latitud = models.FloatField()  # Coordenada de latitud
    longitud = models.FloatField()  # Coordenada de longitud

    def __str__(self):
        return self.nombre
