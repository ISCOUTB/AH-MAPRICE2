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

# Copiar el código de la aplicación
COPY . .

# Cambiar los permisos del directorio de trabajo
RUN chmod -R 755 /app

# Cambiar a usuario root para ejecutar flutter pub get
USER root

# Ejecutar flutter pub get
RUN flutter pub get

# Volver a cambiar a usuario no root
USER flutter_user

# Compila la aplicación para web
RUN flutter build web

# Usar una imagen ligera para servir la aplicación
FROM nginx:alpine AS production

# Copia los archivos generados por Flutter al contenedor Nginx
COPY --from=base /app/build/web /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]



