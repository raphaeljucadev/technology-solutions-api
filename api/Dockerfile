# Usar a imagem do PHP 8.2 com FPM como base
FROM php:8.2-fpm

# Instalar dependências do sistema e o Nginx
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    git \
    unzip \
    nginx && rm -rf /var/lib/apt/lists/*

# Instalar as extensões PHP necessárias
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Instalar o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar a configuração do Nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copiar os arquivos do Laravel para dentro do contêiner
WORKDIR /var/www
COPY . /var/www

# Ajustar permissões para o Laravel
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Instalar dependências do Laravel
RUN composer install --optimize-autoloader --no-dev

# Gerar chave do Laravel
RUN php artisan key:generate

# Expor a porta onde o Laravel vai rodar
EXPOSE 9000

# Comando para iniciar o PHP-FPM e o Nginx
CMD php-fpm
