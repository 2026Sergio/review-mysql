DROP DATABASE IF EXISTS registro_gimnasio;
CREATE DATABASE registro_gimnasio;
USE registro_gimnasio;

-- 1. TABLA CIUDADES
CREATE TABLE ciudades (
    ciudad_id VARCHAR(10) PRIMARY KEY,
    nombre_ciudad VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 2. TABLA SEDES
CREATE TABLE sedes (
    sede_id VARCHAR(10) PRIMARY KEY,
    nombre_sede VARCHAR(120) NOT NULL,
    ciudad_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_sede_ciudad 
        FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
) ENGINE=InnoDB;

-- 3. TABLA SOCIOS
CREATE TABLE socios (
    socio_id INT PRIMARY KEY,
    nombres VARCHAR(120) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 4. TABLA PLANES_ENTRENAMIENTO
CREATE TABLE planes_entrenamiento (
    plan_entrenamiento_id VARCHAR(10) PRIMARY KEY,
    plan_entrenamiento VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 5. TABLA ESPECIALIDADES_ENTRENADORES
CREATE TABLE especialidades_entrenadores (
    especialidad_id VARCHAR(10) PRIMARY KEY,
    nombre_especialidad VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 6. TABLA ENTRENADORES
CREATE TABLE entrenadores (
    entrenador_id VARCHAR(10) PRIMARY KEY,
    nombre_entrenador VARCHAR(120) NOT NULL,
    especialidad_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_entrenador_especialidad 
        FOREIGN KEY (especialidad_id) REFERENCES especialidades_entrenadores(especialidad_id)
) ENGINE=InnoDB;

-- 7. TABLA SOCIO_PLAN_ENTRENAMIENTO (Transaccional)
CREATE TABLE socio_plan_entrenamiento (
    socio_plan_entrenamiento_id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT NOT NULL,
    plan_entrenamiento_id VARCHAR(10) NOT NULL,
    entrenador_id VARCHAR(10) NOT NULL,
    sede_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_spe_socio 
        FOREIGN KEY (socio_id) REFERENCES socios(socio_id),
    CONSTRAINT fk_spe_plan 
        FOREIGN KEY (plan_entrenamiento_id) REFERENCES planes_entrenamiento(plan_entrenamiento_id),
    CONSTRAINT fk_spe_entrenador 
        FOREIGN KEY (entrenador_id) REFERENCES entrenadores(entrenador_id),
    CONSTRAINT fk_spe_sede 
        FOREIGN KEY (sede_id) REFERENCES sedes(sede_id)
) ENGINE=InnoDB;

-- INDICES DE OPTIMIZACIÓN
CREATE INDEX indx_nombres_socios ON socios(nombres, apellidos);
CREATE INDEX indx_nombre_entrenador ON entrenadores(nombre_entrenador);
CREATE INDEX indx_planes_entrenamiento ON planes_entrenamiento(plan_entrenamiento);