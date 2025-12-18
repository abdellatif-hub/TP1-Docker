FROM ubuntu:22.04
RUN apt update && apt install -y apache2
RUN echo "Site Docker TP" > /var/www/html/index.html
CMD ["apache2ctl", "-D", "FOREGROUND"]
