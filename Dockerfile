# Etapa 1: Compilación del código de Flutter
FROM ghcr.io/cirruslabs/flutter:3.13.7 as build

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Permitir que Flutter se ejecute como root
ENV FLUTTER_ALLOW_ROOT=true

# Actualizar el SDK de Dart a la versión 3.5.3
RUN flutter upgrade
RUN flutter channel stable
RUN flutter doctor

# Instala las dependencias
RUN flutter pub get

# Compila la aplicación en modo release (puedes cambiar a 'debug' si es necesario)
RUN flutter build apk --release


# Permitir que Flutter se ejecute como root
ENV FLUTTER_ALLOW_ROOT=true

