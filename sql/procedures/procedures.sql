USE registro_gimnasio;

DELIMITER //

-- Procedimiento: Registrar un socio y asignarle su primer plan
CREATE PROCEDURE sp_registrar_socio_plan(
    IN p_socio_id INT,
    IN p_nombres VARCHAR(120),
    IN p_apellidos VARCHAR(120),
    IN p_telefono VARCHAR(20),
    IN p_plan_id VARCHAR(10),
    IN p_entrenador_id VARCHAR(10),
    IN p_sede_id VARCHAR(10)
)
BEGIN
    -- Insertar socio
    INSERT INTO socios (socio_id, nombres, apellidos, telefono)
    VALUES (p_socio_id, p_nombres, p_apellidos, p_telefono);
    
    -- Inscribir plan
    INSERT INTO socio_plan_entrenamiento (socio_id, plan_entrenamiento_id, entrenador_id, sede_id)
    VALUES (p_socio_id, p_plan_id, p_entrenador_id, p_sede_id);
END //

DELIMITER ;

-- =====================
-- prueba del procedimiento

CALL sp_registrar_socio_plan(105, 'Mario', 'López', '555-9999', 'PE01', 'E01', 'S01');

SELECT * FROM socios WHERE socio_id = 105;
SELECT * FROM socio_plan_entrenamiento WHERE socio_id = 105;
SELECT * FROM auditoria_socios WHERE socio_id = 105;