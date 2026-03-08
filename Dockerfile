# Utilise PHP CLI officiel
FROM php:8.2-cli

# Définir le répertoire de travail
WORKDIR /var/www/html

# Installer Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Garde le conteneur actif
CMD ["bash"]
