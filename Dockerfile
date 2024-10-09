# Usa una imagen de base con Flutter preinstalado
FROM cirrusci/flutter:latest AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo pubspec.yaml y el archivo de código a la imagen
COPY pubspec.yaml ./
COPY lib ./lib
COPY web ./web
COPY android ./android
COPY ios ./ios
COPY test ./test
FROM ubuntu:22.04
# Sensitive
COPY . .
CMD /run.sh
# Instala las dependencias
RUN flutter pub get

# Compila la aplicación para web
RUN flutter build web

# Usar una imagen ligera para servir la aplicación
FROM nginx:alpine

# Copia los archivos generados por Flutter al contenedor Nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
