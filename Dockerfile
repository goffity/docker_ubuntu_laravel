FROM ubuntu

MAINTAINER Goffity Corleone

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl wget build-essential php php-cli php-curl php-xml php-mbstring php-zip git zip unzip nginx

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

EXPOSE 80