FROM php:8.2-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar SOLO la carpeta pública al servidor
COPY público/ /var/www/html/

# Copiar el resto del código (opcional, por si algún módulo llama archivos fuera de /público)
COPY . /var/www/html/

# Dar permisos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Habilitar mod_rewrite (si usas rutas amistosas)
RUN a2enmod rewrite

# Exponer puerto 80
EXPOSE 80

# Iniciar servidor Apache
CMD ["apache2-foreground"]
