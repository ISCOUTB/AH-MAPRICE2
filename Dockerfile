FROM ubuntu:22.04 AS build

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    xz-utils \
    curl \
    git \
    bash

# Descargar e instalar Flutter
RUN wget https://storage.googleapis.com/download.flutter.io/linux/flutter_linux_3.10.5-stable.tar.xz && \
    tar xf flutter_linux_3.10.5-stable.tar.xz && \
    rm flutter_linux_3.10.5-stable.tar.xz

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Crea un usuario no root
RUN useradd -ms /bin/bash flutter_user
USER flutter_user

WORKDIR /app

COPY . .

RUN flutter pub get

RUN flutter build apk --release

# Permitir que Flutter se ejecute como root
ENV FLUTTER_ALLOW_ROOT=true

