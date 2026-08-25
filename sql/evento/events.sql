USE registro_gimnasio;

-- Activar el programador de eventos
SET GLOBAL event_scheduler = ON;

-- Evento diario: Limpieza o reporte preventivo a medianoche
CREATE EVENT IF NOT EXISTS evt_limpieza_auditoria_semanal
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP
DO
    DELETE FROM auditoria_socios 
    WHERE fecha_registro < NOW() - INTERVAL 30 DAY;


-- ====================
-- prueba del evento

SHOW VARIABLES LIKE 'event_scheduler';

SHOW EVENTS FROM registro_gimnasio;