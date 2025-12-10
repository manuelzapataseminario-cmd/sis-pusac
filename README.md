# SIS-PUSAC (skeleton)
Proyecto esqueleto para el sistema Centro de Salud Pusac.

Contenido:
- Estructura básica PHP + MySQL
- Dashboard placeholder (public/index.php)
- Configuración de base de datos: config/db.php
- SQL inicial: sql/sis_pusac.sql
- Módulos: pacientes, atenciones, vacunacion, laboratorio, reportes

Instrucciones rápidas para subir a GitHub y clonar en servidor:

1. Inicializar repositorio local:
   git init
   git add .
   git commit -m "Initial commit - SIS-PUSAC skeleton"
   git branch -M main
   git remote add origin https://github.com/manuelzapataseminario-cmd/sis-pusac.git
   git push -u origin main

2. En el servidor Ubuntu:
   cd /var/www/html
   sudo git clone https://github.com/manuelzapataseminario-cmd/sis-pusac.git
   sudo chown -R www-data:www-data /var/www/html/sis-pusac
   sudo chmod -R 755 /var/www/html/sis-pusac

3. Importar la base de datos:
   mysql -u root -p
   CREATE DATABASE sis_pusac CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   exit
   mysql -u root -p sis_pusac < sql/sis_pusac.sql

4. Editar config/db.php con credenciales reales.

NOTA: Este paquete es un esqueleto completo para comenzar; reemplazar y añadir módulos según lo desarrollado.
# Redeploy Railway
