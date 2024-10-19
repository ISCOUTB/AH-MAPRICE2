# Usa una imagen base de Ubuntu
FROM ubuntu:22.04 AS base

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    xz-utils \
    curl \
    git \
    bash \
    openjdk-11-jdk \
    libglu1-mesa

# Descargar e instalar Flutter
RUN wget https://storage.googleapis.com/download.flutter.io/linux/flutter_linux_3.10.6-stable.tar.xz && \
    tar xf flutter_linux_3.10.6-stable.tar.xz && \
    rm flutter_linux_3.10.6-stable.tar.xz

# Configurar el PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Crear un usuario no root
RUN useradd -ms /bin/bash flutter_user
USER flutter_user

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación
COPY . .

# Instalar dependencias de Flutter
RUN flutter pub get

# Compilar la aplicación
RUN flutter build apk --release
