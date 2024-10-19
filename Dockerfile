# Usa la imagen oficial de Flutter
FROM cirruslabs/flutter:3.10.0 AS build

# Crea un usuario no root
RUN useradd -ms /bin/bash flutter_user
USER flutter_user

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de tu proyecto al contenedor
COPY . .

# Instala las dependencias
RUN flutter pub get

# Compila la aplicación en modo release
RUN flutter build apk --release

# Etapa 2: Imagen final para producción
FROM alpine:latest

# Establece el directorio de trabajo
WORKDIR /app

# Copia los artefactos compilados desde la etapa anterior
COPY --from=build /app/build/app/outputs/flutter-apk/app-release.apk /app

# Define el comando para iniciar la aplicación (ajusta según sea necesario)
CMD ["flutter", "run"]

# Permitir que Flutter se ejecute como root
ENV FLUTTER_ALLOW_ROOT=true

