-- Carga de Ciudades
INSERT INTO ciudades (ciudad_id, nombre_ciudad) VALUES 
('C01', 'Madrid');

-- Carga de Sedes
INSERT INTO sedes (sede_id, nombre_sede, ciudad_id) VALUES 
('S01', 'Sede Norte', 'C01'),
('S02', 'Sede Sur', 'C01');

-- Carga de Socios
INSERT INTO socios (socio_id, nombres, apellidos, telefono) VALUES 
(101, 'Ana', 'Pérez', '555-1234'),
(102, 'Luis', 'Gómez', '555-5678'),
(103, 'Carla', 'Ruíz', '555-9012');

-- Carga de Planes de Entrenamiento
INSERT INTO planes_entrenamiento (plan_entrenamiento_id, plan_entrenamiento) VALUES 
('PE01', 'Yoga'),
('PE02', 'Pesas'),
('PE03', 'CrossFit'),
('PE04', 'Boxeo');

-- Carga de Especialidades
INSERT INTO especialidades_entrenadores (especialidad_id, nombre_especialidad) VALUES 
('EE01', 'Yoga'),
('EE02', 'Musculación'),
('EE03', 'Funcional'),
('EE04', 'Boxeo');

-- Carga de Entrenadores
INSERT INTO entrenadores (entrenador_id, nombre_entrenador, especialidad_id) VALUES 
('E01', 'Carlos', 'EE01'),
('E02', 'Marta', 'EE02'),
('E03', 'Iván', 'EE03'),
('E04', 'Diego', 'EE04');

-- Carga de Transacciones (Socio - Plan - Entrenador - Sede)
INSERT INTO socio_plan_entrenamiento (socio_plan_entrenamiento_id, socio_id, plan_entrenamiento_id, entrenador_id, sede_id) VALUES 
(1001, 101, 'PE01', 'E01', 'S01'),
(1002, 101, 'PE02', 'E02', 'S01'),
(1003, 102, 'PE03', 'E03', 'S02'),
(1004, 103, 'PE02', 'E02', 'S01'),
(1005, 103, 'PE04', 'E04', 'S01');