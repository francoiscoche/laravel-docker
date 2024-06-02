FROM php:8.1-fpm

# Installation des dépendances de PHP nécessaires
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl \
    gnupg \
    && docker-php-ext-install pdo_mysql zip

# Installation de Node.js et npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Copie des fichiers de l'application dans le conteneur
COPY . /var/www

# Définition du répertoire de travail
WORKDIR /var/www

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installation des dépendances de l'application
RUN composer install

RUN npm install

RUN php artisan passport:install

# Exposition du port 9000 pour PHP-FPM
EXPOSE 9000

# Commande par défaut pour démarrer PHP-FPM
CMD ["php-fpm"]
