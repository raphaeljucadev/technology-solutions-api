# Imagem base
FROM php:8.2-fpm

# Instalação das dependências do sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Instalação das extensões PHP necessárias
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Instalação do Composer (gerenciador de dependências PHP)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definindo o diretório de trabalho
WORKDIR /var/www

# Copiando todos os arquivos do projeto Laravel para o container
COPY . /var/www

# Instalando as dependências do Laravel
RUN composer install --optimize-autoloader --no-dev

# Gerando a chave do Laravel
RUN php artisan key:generate

# Configurando permissões para o diretório de armazenamento e cache
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Importando a estrutura e dados do banco de dados MySQL
COPY technology_solutions_db.sql /docker-entrypoint-initdb.d/

# Expondo a porta onde o Laravel vai rodar
EXPOSE 80

# Comando para iniciar o servidor PHP embutido do Laravel
CMD ["php-fpm"]
