# Usa una imagen base de Ubuntu
FROM ubuntu:22.04 AS base

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    git \
    bash \
    openjdk-11-jdk \
    libglu1-mesa \
    curl  # Agregamos curl aquí

# Clonar el repositorio de Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter

# Cambiar la propiedad del directorio /flutter
RUN chown -R $(id -u):$(id -g) /flutter

# Configurar el PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Crear un usuario no root
RUN useradd -ms /bin/bash flutter_user

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación
COPY . .

# Cambiar a usuario root temporalmente para instalar dependencias
USER root

# Ejecutar flutter pub get como root
RUN flutter pub get

# Cambiar de nuevo al usuario no root
USER flutter_user

# Compilar la aplicación
RUN flutter build apk --release


