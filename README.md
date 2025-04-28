
# Dockerized Apache Web Server with Custom HTML
[Docker Hub Image Link](https://hub.docker.com/layers/karnank25/karnank25/latest/images/sha256:f849da8cfa7138fe1338cd605884713e97da2bd5c0f39cca72fc621817bb2c63?uuid=4277d253-2197-4396-b748-f6d722367649%0A)


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
```

### 2. **Build the Docker Image**

After creating the `Dockerfile`, build the Docker image with the following command:

```bash
docker build -t ubuntu_apache .
```

This will create a Docker image named `ubuntu_apache` based on the instructions in the `Dockerfile`.

### 3. **Run the Docker Container with Custom HTML File**

Run the container with your custom HTML file mounted. The command will:

- Map **port 81** on the host machine to **port 80** inside the container.
- Use the `-v` flag to **mount** your `sample.html` file from your local machine to the Apache web directory inside the container.

Run the following command to start the container:

```bash
docker run -d -p 81:80 --name myapache -v /path/to/your/sample.html:/var/www/html/index.html ubuntu_apache
```

Make sure to replace `/path/to/your/sample.html` with the actual path to your custom HTML file.

### 4. **Access Your Web Server**

Once the container is running, you can access your custom HTML page in the browser by visiting:

```
http://localhost:81
```

This will display the `sample.html` file that you mounted into the container.

## Summary of Commands

1. **Build the Docker Image:**

   ```bash
   docker build -t ubuntu_apache .
   ```

2. **Run the Docker Container with Custom HTML:**

   ```bash
   docker run -d -p 81:80 --name myapache -v /path/to/your/sample.html:/var/www/html/index.html ubuntu_apache
   ```

## Explanation

- **Port Mapping (`-p 81:80`)**: Maps port 81 on your local machine to port 80 inside the container. This allows you to access the Apache server via `http://localhost:81`.
- **Volume Mount (`-v`)**: This mounts your local `sample.html` file to the Apache web directory (`/var/www/html/index.html`) inside the container. Any changes you make to `sample.html` will be reflected inside the container immediately, without rebuilding the image.

## Why Use This?

- Docker allows you to **package and isolate** the Apache web server along with custom content.
- **Mounting** the HTML file allows you to update the content dynamically without having to rebuild the container.
- Running Apache in **foreground** ensures the container stays active to serve the content.

## Enjoy!

You now have a **Dockerized Apache Web Server** serving your custom HTML page. 🎉
