USE registro_gimnasio;

-- Crear roles de usuario
CREATE USER IF NOT EXISTS 'recepcion_gym'@'localhost' IDENTIFIED BY 'Recepcion123!';
CREATE USER IF NOT EXISTS 'admin_gym'@'localhost' IDENTIFIED BY 'AdminPass456!';

-- Privilegios para Recepción (Solo lectura y registro de socios/planes)
GRANT SELECT ON registro_gimnasio.* TO 'recepcion_gym'@'localhost';
GRANT INSERT, UPDATE ON registro_gimnasio.socios TO 'recepcion_gym'@'localhost';
GRANT INSERT ON registro_gimnasio.socio_plan_entrenamiento TO 'recepcion_gym'@'localhost';

-- Privilegios para Administrador (Acceso total)
GRANT ALL PRIVILEGES ON registro_gimnasio.* TO 'admin_gym'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'recepcion_gym'@'localhost';