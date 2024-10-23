import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductMapPage(),
    );
  }
}

class ProductMapPage extends StatefulWidget {
  @override
  _ProductMapPageState createState() => _ProductMapPageState();
}

class _ProductMapPageState extends State<ProductMapPage> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  // Lista de productos con varias ubicaciones por producto
  final List<Map<String, dynamic>> _products = [
    // Producto por defecto
    {'name': 'Leche', 'price': 1500, 'location': LatLng(10.3885, -75.482)},
    // Pan
    {'name': 'Pan', 'price': 2000, 'location': LatLng(10.3892, -75.4789)},
    {'name': 'Pan', 'price': 2200, 'location': LatLng(10.3910, -75.4800)},
    {'name': 'Pan', 'price': 2100, 'location': LatLng(10.3950, -75.4810)},
    // Manzanas
    {'name': 'Manzanas', 'price': 5000, 'location': LatLng(10.3932, -75.4832)},
    {'name': 'Manzanas', 'price': 4500, 'location': LatLng(10.3970, -75.4870)},
    {'name': 'Manzanas', 'price': 5200, 'location': LatLng(10.4100, -75.4700)},
    // Bananas
    {'name': 'Bananas', 'price': 3000, 'location': LatLng(10.4000, -75.5000)},
    {'name': 'Bananas', 'price': 2800, 'location': LatLng(10.4050, -75.5030)},
    {'name': 'Bananas', 'price': 3200, 'location': LatLng(10.3980, -75.4890)},
    // Otros productos de la canasta básica
    {'name': 'Harina de trigo', 'price': 1000, 'location': LatLng(10.3860, -75.4800)},
    {'name': 'Arroz', 'price': 2000, 'location': LatLng(10.3920, -75.4790)},
    {'name': 'Aceite', 'price': 2500, 'location': LatLng(10.3900, -75.4840)},
  ];

  // Función para filtrar productos por nombre
  List<Map<String, dynamic>> _filterProducts(String query) {
    return _products.where((product) => product['name'].toLowerCase().contains(query.toLowerCase())).toList();
  }

  // Función para agregar marcadores en el mapa
  void _addMarkers(List<Map<String, dynamic>> products) {
    setState(() {
      _markers.clear();
      for (var product in products) {
        _markers.add(
          Marker(
            markerId: MarkerId(product['location'].toString()),
            position: product['location'],
            infoWindow: InfoWindow(
              title: product['name'],
              snippet: 'Precio: ${product['price']} COP',
            ),
          ),
        );
      }
    });
  }

  // Función para mover la cámara del mapa
  void _moveCameraToMarkers(List<Map<String, dynamic>> products) {
    if (products.isNotEmpty) {
      _mapController?.animateCamera(CameraUpdate.newLatLng(products[0]['location']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Productos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10.3932, -75.4832),  // Ubicación inicial
                zoom: 12,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}

