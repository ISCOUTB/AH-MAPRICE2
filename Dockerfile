# Etapa 1: Compilación del código de Flutter
FROM cirrusci/flutter:latest as build

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Instala las dependencias
RUN flutter pub get

# Compila la aplicación en modo release (puedes cambiar a 'debug' si es necesario)
RUN flutter build apk --release

# Etapa 2: Imagen final para producción
FROM alpine:latest

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los artefactos compilados desde la etapa anterior
COPY --from=build /app/build/app/outputs/flutter-apk/app-release.apk /app

# Define el comando para iniciar la aplicación (en este caso es una APK compilada)
CMD ["flutter", "run"]
