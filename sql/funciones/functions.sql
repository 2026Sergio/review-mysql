USE registro_gimnasio;

DELIMITER //

-- Función: Total de planes inscritos por un socio
CREATE FUNCTION fn_total_planes_socio(p_socio_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total 
    FROM socio_plan_entrenamiento 
    WHERE socio_id = p_socio_id;
    RETURN v_total;
END //

DELIMITER ;

-- =====================================
-- prueba

SELECT fn_total_planes_socio(101) AS cantidad_planes;