FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2

COPY sample.html /var/www/html/index.html


EXPOSE 80

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]


