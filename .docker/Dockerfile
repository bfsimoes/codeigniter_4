FROM php:7.2-apache
RUN apt-get update
RUN apt-get upgrade -y

#PHP needed extensions
RUN apt-get install --fix-missing -y libpq-dev
RUN apt-get install --no-install-recommends -y libpq-dev
RUN apt-get install -y libxml2-dev libbz2-dev zlib1g-dev
RUN apt-get -y install curl exif ftp
RUN docker-php-ext-install intl
RUN apt-get -y install --fix-missing zip unzip

# mod_rewrite + SSL
RUN a2enmod rewrite
RUN a2enmod ssl

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN composer self-update

# Virtual host
ADD conf/apache.conf /etc/apache2/sites-available/000-default.conf

# Script to apply chmod changes to CI writable folder
ADD startScript.sh /startScript.sh
RUN chmod +x /startScript.sh

RUN apt-get clean \
    && rm -r /var/lib/apt/lists/*

EXPOSE 80
VOLUME ["/var/www/html", "/var/log/apache2", "/etc/apache2"]
CMD ["bash", "/startScript.sh"]