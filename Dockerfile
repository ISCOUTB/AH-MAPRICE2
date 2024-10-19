# Usa una imagen base de Ubuntu
FROM ubuntu:22.04 AS base

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    git \
    bash \
    openjdk-11-jdk \
    libglu1-mesa \
    curl \
    unzip  # Agregamos unzip aquí

# Clonar el repositorio de Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter

# Cambiar la propiedad del directorio /flutter
RUN chown -R 1000:1000 /flutter  # Cambia la propiedad a un UID y GID que coincida con flutter_user

# Configurar el PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Crear un usuario no root
RUN useradd -u 1000 -ms /bin/bash flutter_user

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación
COPY . .

# Cambiar a usuario no root
USER flutter_user

# Ejecutar flutter pub get como flutter_user
RUN flutter pub get

# Compilar la aplicación
RUN flutter build apk --release

