# Maprice 2

Maprice 2 es una aplicación móvil que permite a los usuarios comparar precios de productos en diferentes zonas, gestionar locales favoritos y recibir notificaciones sobre cambios en precios.

## Características principales
- **Mapa interactivo:** Visualiza precios de productos en diferentes zonas.
- **Locales favoritos:** Gestión personalizada de tiendas y productos.
- **Notificaciones:** Alertas sobre cambios en precios y promociones.
- **Búsqueda optimizada:** Encuentra productos rápidamente.

## Requisitos del sistema
- **Frontend:** Flutter (iOS y Android).
- **Backend:** Firebase para autenticación y base de datos en tiempo real.
- **APIs externas:** Servicios de geolocalización y precios.

## Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/usuario/maprice2.git
   cd maprice2

    Configurar Firebase:
        Crear un proyecto en Firebase Console.
        Descargar google-services.json (Android) o GoogleService-Info.plist (iOS).
        Colocar los archivos en:
            android/app/google-services.json
            ios/Runner/GoogleService-Info.plist

    Instalar dependencias:

flutter pub get

Ejecutar el proyecto:

    flutter run

Estructura del proyecto

📂 maprice2/
├── android/           # Configuración Android
├── ios/               # Configuración iOS
├── lib/               # Código Flutter
│   ├── models/        # Modelos de datos
│   ├── screens/       # Pantallas de la app
│   ├── widgets/       # Componentes reutilizables
│   └── main.dart      # Entrada principal
├── assets/            # Imágenes y recursos
└── pubspec.yaml       # Configuración de dependencias

Cómo contribuir

    Haz un fork del repositorio.
    Crea una rama:

git checkout -b feature/nueva-funcionalidad

Haz cambios y realiza un commit:

git commit -m "Descripción del cambio"

Sube tus cambios:

git push origin feature/nueva-funcionalidad

Abre un Pull Request en GitHub.
