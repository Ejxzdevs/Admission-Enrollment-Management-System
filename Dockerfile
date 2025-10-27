# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install essential PHP extensions for MySQL, PDO, GD, and ZIP support
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install mysqli pdo pdo_mysql gd zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy only composer files first to leverage Docker cache (optional optimization)
COPY composer.json composer.lock* ./

# Install PHP dependencies (if your project uses Composer)
# The --no-scripts flag avoids issues if autoload tries to run before files exist
RUN composer install --no-dev --optimize-autoloader --no-scripts || true

# Copy the rest of your application into the container
COPY . /var/www/html/

# Give Apache ownership of the web directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Enable Apache mod_rewrite (useful for frameworks like Laravel, CodeIgniter, etc.)
RUN a2enmod rewrite

# Start Apache
CMD ["apache2-foreground"]
