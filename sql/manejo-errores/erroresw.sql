DELIMITER //

CREATE PROCEDURE sp_registrar_socio(
    IN p_nombre VARCHAR(60),
    IN p_telefono VARCHAR(20),
    IN p_plan_id INT,
    IN p_sede_id INT
)
BEGIN
    -- Manejo de errores de negocio
    IF p_nombre = '' OR p_nombre IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de negocio: El nombre del socio no puede estar vacío.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM planes WHERE id = p_plan_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de negocio: El plan seleccionado no existe.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM sedes WHERE id = p_sede_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de negocio: La sede especificada no existe.';
    END IF;

    -- Inserción segura
    INSERT INTO socios (nombre_socio, telefono, plan_id, sede_id)
    VALUES (p_nombre, p_telefono, p_plan_id, p_sede_id);
    
END//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_total_socios_sede(p_sede_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total FROM socios WHERE sede_id = p_sede_id;
    RETURN v_total;
END//

DELIMITER ;

-- 1. Crear usuarios (contraseñas de ejemplo)
CREATE USER 'admin_gimnasio'@'localhost' IDENTIFIED BY 'Admin123*';
CREATE USER 'recepcion_user'@'localhost' IDENTIFIED BY 'Recepcion123*';
CREATE USER 'entrenador_user'@'localhost' IDENTIFIED BY 'Trainer123*';

-- 2. Asignar privilegios
GRANT ALL PRIVILEGES ON gimnasio_db.* TO 'admin_gimnasio'@'localhost';

GRANT SELECT, INSERT, UPDATE ON gimnasio_db.socios TO 'recepcion_user'@'localhost';
GRANT SELECT ON gimnasio_db.planes TO 'recepcion_user'@'localhost';
GRANT SELECT ON gimnasio_db.sedes TO 'recepcion_user'@'localhost';

GRANT SELECT ON gimnasio_db.socios TO 'entrenador_user'@'localhost';
GRANT SELECT ON gimnasio_db.socio_entrenador TO 'entrenador_user'@'localhost';
GRANT SELECT ON gimnasio_db.entrenadores TO 'entrenador_user'@'localhost';

FLUSH PRIVILEGES;