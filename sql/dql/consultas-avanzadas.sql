-- Consulta 1: Listar socios con su sede, plan y total de entrenadores asignados
SELECT 
    s.id AS socio_id,
    s.nombre_socio,
    se.nombre_sede,
    p.nombre_plan,
    COUNT(e.entrenador_id) AS total_entrenadores
FROM socios s
JOIN sedes se ON s.sede_id = se.id
JOIN planes p ON s.plan_id = p.id
LEFT JOIN socio_entrenador e ON s.id = e.socio_id
GROUP BY s.id, s.nombre_socio, se.nombre_sede, p.nombre_plan;

-- Consulta 2: Ranking de entrenadores por cantidad de socios inscritos
SELECT 
    en.nombre AS entrenador,
    en.especialidad,
    COUNT(se.socio_id) AS total_socios
FROM entrenadores en
LEFT JOIN socio_entrenador se ON en.id = se.entrenador_id
GROUP BY en.id, en.nombre, en.especialidad
ORDER BY total_socios DESC;