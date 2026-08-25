USE registro_gimnasio;

-- Tabla de auditoría
CREATE TABLE IF NOT EXISTS auditoria_socios (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

DELIMITER //

-- Trigger: Registrar auditoría al crear un nuevo socio
CREATE TRIGGER trg_after_insert_socio
AFTER INSERT ON socios
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_socios (socio_id, accion)
    VALUES (NEW.socio_id, 'SOCIO_REGISTRADO');
END //

DELIMITER ;

-- =====================
-- probar trigger

INSERT INTO socios (socio_id, nombres, apellidos, telefono)
VALUES (104, 'Roberto', 'Morales', '555-0000');

SELECT * FROM auditoria_socios;