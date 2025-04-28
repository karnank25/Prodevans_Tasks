# Dockerized Apache Web Server with Custom HTML

## Overview

This project demonstrates how to **Dockerize an Apache web server** using a **custom HTML file**. It sets up a Docker container that installs Apache, serves a custom HTML file, and allows access to the server through a specified port.

## Requirements

- Docker installed on your machine
- A custom HTML file (e.g., `sample.html`)

## Steps to Set Up

### 1. **Create the Dockerfile**

The `Dockerfile` contains instructions to build the Docker image. Here's the content of the `Dockerfile`:

```dockerfile
# Step 1: Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Step 2: Update packages and install Apache web server
RUN apt-get update && apt-get install -y apache2

# Step 3: Expose Apache's default port 80
EXPOSE 80

# Step 4: Run Apache in the foreground when the container starts
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

#build the image
docker build -t ubuntu_apache .

#running the conatiner using the image and mounting

docker run -d -p 81:80 --name myapache -v /path/to/your/sample.html:/var/www/html/index.html ubuntu_apache
