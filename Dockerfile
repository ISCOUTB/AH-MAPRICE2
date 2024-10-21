# Base image
FROM ubuntu:22.04 as base

# Install dependencies
RUN apt-get update && \
    apt-get install -y git bash openjdk-11-jdk libglu1-mesa curl unzip

# Clone Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
RUN chown -R 1000:1000 /flutter

# Create a user
RUN useradd -u 1000 -ms /bin/bash flutter_user
USER flutter_user

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Make the app directory writable
RUN chmod -R 755 /app

# Set up Git safe directory
RUN git config --global --add safe.directory /flutter

# Get Flutter dependencies
RUN flutter pub get

# Compile the application
RUN flutter build web

# Expose the web server port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]




