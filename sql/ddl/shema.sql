CREATE DATABASE IF NOT EXISTS gimnasio_db;
USE gimnasio_db;

CREATE TABLE sedes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sede VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE planes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plan VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    activo TINYINT(1) DEFAULT 1
);

CREATE TABLE socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_socio VARCHAR(60) NOT NULL,
    telefono VARCHAR(20),
    plan_id INT,
    sede_id INT,
    CONSTRAINT fk_socio_plan FOREIGN KEY (plan_id) REFERENCES planes(id),
    CONSTRAINT fk_socio_sede FOREIGN KEY (sede_id) REFERENCES sedes(id)
);

CREATE TABLE socio_entrenador (
    socio_id INT,
    entrenador_id INT,
    PRIMARY KEY (socio_id, entrenador_id),
    CONSTRAINT fk_se_socio FOREIGN KEY (socio_id) REFERENCES socios(id),
    CONSTRAINT fk_se_entrenador FOREIGN KEY (entrenador_id) REFERENCES entrenadores(id)
);