-- SIS-PUSAC initial schema (skeleton)
CREATE DATABASE IF NOT EXISTS `sis_pusac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `sis_pusac`;

-- users
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  fullname VARCHAR(200),
  role ENUM('admin','medico','enfermera','laboratorio','farmacia','registro') DEFAULT 'registro',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- pacientes
CREATE TABLE IF NOT EXISTS pacientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dni VARCHAR(20),
  nombres VARCHAR(200),
  apellidos VARCHAR(200),
  fecha_nacimiento DATE,
  sexo ENUM('M','F','O'),
  direccion TEXT,
  telefono VARCHAR(50),
  seguro VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- atenciones (FUA simplified)
CREATE TABLE IF NOT EXISTS atenciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paciente_id INT,
  fecha DATETIME,
  servicio VARCHAR(100),
  profesional VARCHAR(200),
  motivo TEXT,
  diagnostico TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- vacunacion
CREATE TABLE IF NOT EXISTS vacunacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paciente_id INT,
  vacuna VARCHAR(150),
  fecha_aplicacion DATE,
  dosis VARCHAR(50),
  profesional VARCHAR(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- laboratorio
CREATE TABLE IF NOT EXISTS laboratorio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paciente_id INT,
  examen VARCHAR(200),
  resultado TEXT,
  fecha DATE,
  profesional VARCHAR(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- reportes_log (audit)
CREATE TABLE IF NOT EXISTS reportes_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  reporte_nombre VARCHAR(200),
  usuario VARCHAR(100),
  parametros TEXT,
  generado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- seed admin user (password 'admin123' hashed with password_hash in PHP expected)
INSERT INTO users (username, password, fullname, role) VALUES
('admin', '$2y$10$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'Admin SIS Pusac', 'admin');
