# home/views.py
from django.shortcuts import render
from .models import Producto
from django.contrib.auth.decorators import login_required

@login_required
def home(request):
    productos = list(Producto.objects.values('nombre', 'descripcion', 'latitud', 'longitud'))
    return render(request, 'home.html', {'productos': productos})
