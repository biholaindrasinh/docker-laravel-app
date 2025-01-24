FROM php:8.0-apache

# Install necessary PHP extensions for MySQL
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Enable Apache mod_rewrite (important for Laravel)
RUN a2enmod rewrite

# Expose the necessary ports
EXPOSE 80
