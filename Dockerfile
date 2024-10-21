# Usa una imagen base de Ubuntu
FROM ubuntu:22.04 AS base
#crear nginx 
FROM nginx:alpine as final

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    git \
    bash \
    openjdk-11-jdk \
    libglu1-mesa \
    curl \
    unzip

# Clonar el repositorio de Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter

# Cambiar la propiedad del directorio /flutter
RUN chown -R 1000:1000 /flutter

# Configurar el PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Crear un usuario no root
RUN useradd -u 1000 -ms /bin/bash flutter_user

# Establecer el directorio de trabajo
WORKDIR /app

# Cambiar la propiedad del directorio de trabajo para flutter_user
RUN chown -R flutter_user:flutter_user /app

# Copiar el código de la aplicación
COPY . .
# Copiar nginx  
COPY ./nginx_confign /etc/nginx/conf.d/
# Cambiar a usuario root temporalmente para ajustar permisos en la carpeta de trabajo
USER root
RUN chmod -R 777 /app

# Cambiar a usuario no root
USER flutter_user

# Ejecutar flutter pub get
RUN flutter pub get

# Cambiar de nuevo a root para asegurarse de que los archivos tengan los permisos adecuados
USER root
RUN chown -R flutter_user:flutter_user /app

# Cambiar a usuario flutter_user para el resto de operaciones
USER flutter_user
EXPOSE  80
# Establecer el CMD para ejecutar flutter pub get al iniciar el contenedor
CMD ["nginx", "-g", "daemon off;"]


