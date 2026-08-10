INSERT INTO sedes (nombre_sede, ciudad) VALUES ('Sede Norte', 'Madrid'), ('Sede Sur', 'Madrid');

INSERT INTO planes (nombre_plan, precio) VALUES ('Yoga y Pesas', 50.00), ('CrossFit', 65.00);

INSERT INTO entrenadores (nombre, especialidad) VALUES 
('Carlos', 'Yoga'), 
('Marta', 'Musculación'), 
('Iván', 'Funcional');

-- Datos basados en tu Excel
INSERT INTO socios (id, nombre_socio, telefono, plan_id, sede_id) VALUES 
(101, 'Ana Pérez', '555-1234', 1, 1),
(102, 'Luis Gómez', '555-5678', 2, 2);

INSERT INTO socio_entrenador (socio_id, entrenador_id) VALUES 
(101, 1), 
(101, 2), 
(102, 3);