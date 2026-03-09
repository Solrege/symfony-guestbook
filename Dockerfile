FROM php:8.3-fpm

# 1. Instalar dependencias del SO
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    libpq-dev \
    libzip-dev \
    libxslt-dev \
    librabbitmq-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Configurar e instalar extensiones nativas de PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    intl \
    pdo_pgsql \
    pdo_mysql \
    xsl \
    gd \
    zip \
    opcache

# 3. Instalar extensiones mediante PECL (Redis y AMQP)
RUN pecl install redis amqp \
    && docker-php-ext-enable redis amqp

# 4. Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir el directorio de trabajo
WORKDIR /var/www/html