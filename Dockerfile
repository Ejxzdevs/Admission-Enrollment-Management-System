# Use the official PHP image with Apache as a base
FROM php:8.0-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install dependencies for Composer (unzip, git, and zip extension)
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer for managing PHP packages
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the PHP files (including composer.json) into the container
COPY . /var/www/html/

# Run Composer to install dependencies (now that composer.json is available)
RUN composer install

# Expose the port that Apache will run on
EXPOSE 80
