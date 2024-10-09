# Maprice 🗺️

¡Bienvenidos a la aplicación **Mapa de Productos**! Este proyecto es una app de Flutter que te ayuda a encontrar los mejores precios de productos en diferentes ubicaciones, todo dentro de un mapa interactivo de Google Maps. Ideal para comparar precios y hacer compras inteligentes en tu zona

## 📋 Descripción del Proyecto

Esta app tiene como objetivo permitir a los usuarios encontrar productos específicos, ver dónde se venden y comparar los precios en diferentes locales cercanos. La idea es proporcionar una forma intuitiva y visual de realizar comparaciones de precios sin tener que recorrer físicamente los lugares.

### Características principales:
- 🗺️ **Mapa interactivo**: Visualiza en el mapa las ubicaciones donde se venden productos y sus respectivos precios.
- 🔎 **Búsqueda avanzada**: Busca productos utilizando el campo de texto con autocompletado.
- 📍 **Marcadores dinámicos**: Muestra las ubicaciones con precios en tiempo real según lo que busques.
- 🏃 **Fácil de usar**: Navegación fluida y rápida con una interfaz intuitiva.

## 🚀 Endpoints y Funcionalidades

### 1. **Pantalla Principal (`/`)**
   - **Descripción**: Carga la vista inicial con el mapa de Google y el buscador de productos.
   - **Comportamiento**: Muestra un mapa centrado en una ubicación predeterminada con un campo de búsqueda para encontrar productos.
   
### 2. **Buscar Producto (`/buscar`)**
   - **Descripción**: Busca productos por nombre utilizando la barra de búsqueda interactiva.
   - **Cómo Funciona**:
     - El usuario escribe el nombre del producto.
     - Se sugieren productos basados en la entrada del usuario utilizando `TypeAheadField`.
     - Al seleccionar un producto, se actualizan los marcadores en el mapa.
   
### 3. **Mostrar Marcadores (`/marcadores`)**
   - **Descripción**: Agrega marcadores en el mapa según las ubicaciones y precios de los productos buscados.
   - **Características**:
     - Cada marcador representa una ubicación donde se vende el producto.
     - Muestra una ventana emergente con información del producto y el precio en COP.

### 4. **Control de Cámara (`/mover-camara`)**
   - **Descripción**: Mueve la cámara del mapa a la primera ubicación del producto seleccionado.
   - **Cómo Funciona**:
     - Al seleccionar un producto en la barra de búsqueda, la cámara se centra automáticamente en la primera ubicación de ese producto.

## 🛠️ Configuración y Requisitos Previos

### Requisitos
1. **Flutter SDK** (versión recomendada: 2.0+)
2. Dependencias necesarias:
   - `google_maps_flutter`: Para la integración con Google Maps.
   - `flutter_typeahead`: Para el campo de búsqueda con sugerencias.
3. **Clave de API de Google Maps**: Necesitas una clave de API válida para la visualización del mapa. Puedes obtenerla [aquí](https://console.cloud.google.com/).

### Instalación
1. Clona el repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu-usuario/mapa-de-productos.git

## 🌟 Cómo Contribuir

Si te interesa contribuir al proyecto y hacerlo más robusto, ¡te doy la bienvenida! Puedes seguir los siguientes pasos para agregar nuevas características, corregir errores o mejorar el diseño:

1. **Fork** el repositorio.
2. Crea una rama para tu nueva funcionalidad:
   git checkout -b mi-nueva-funcionalidad

3. Realiza tus cambios y haz un commit:
   git commit -m "Añadí funcionalidad de filtros de precio"

4. Haz push a tu rama:
   git push origin mi-nueva-funcionalidad

5. Crea un pull request explicando tus cambios.

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. ¡Siéntete libre de usarlo, modificarlo y mejorarlo!

Si tienes alguna pregunta, sugerencia o encuentras un error, no dudes en abrir un issue. ¡Gracias por visitar y contribuir!

