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