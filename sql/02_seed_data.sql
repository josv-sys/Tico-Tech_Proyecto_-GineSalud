-- ============================================================
-- GineSalud - Datos de prueba (seed data) para el prototipo
-- Ejecutar después de 01_schema.sql
-- ============================================================

BEGIN;

INSERT INTO rol (nombre_rol, descripcion) VALUES
('Administrador', 'Gestiona usuarios, permisos y reportes generales del sistema'),
('Recepcionista', 'Gestiona pacientes y citas médicas'),
('Ginecólogo', 'Gestiona expedientes clínicos, diagnósticos y tratamientos');

INSERT INTO especialidad (nombre_especialidad, descripcion) VALUES
('Ginecología General', 'Consultas ginecológicas generales'),
('Obstetricia', 'Seguimiento de embarazo y parto'),
('Endocrinología Ginecológica', 'Trastornos hormonales relacionados a la salud reproductiva');

-- NOTA: password_hash es un valor de ejemplo; en el sistema real debe generarse
-- con el mecanismo de hashing de Django (PBKDF2 por defecto), nunca en texto plano.
INSERT INTO usuario (nombre_usuario, correo, password_hash, id_rol) VALUES
('admin.ginesalud', 'admin@ginesalud.cr', 'CAMBIAR_POR_HASH_REAL', 1),
('recepcion1', 'recepcion1@ginesalud.cr', 'CAMBIAR_POR_HASH_REAL', 2),
('dra.mendez', 'dra.mendez@ginesalud.cr', 'CAMBIAR_POR_HASH_REAL', 3);

INSERT INTO medico (nombre_completo, id_especialidad, id_usuario, telefono, correo) VALUES
('Dra. Ana Méndez', 1, 3, '8888-0001', 'dra.mendez@ginesalud.cr');

INSERT INTO paciente (nombre_completo, cedula, fecha_nacimiento, telefono, correo, direccion) VALUES
('María José Rojas', '1-1111-1111', '1990-05-14', '8888-1234', 'mrojas@example.com', 'San José, Costa Rica'),
('Laura Fernández', '2-2222-2222', '1985-11-02', '8888-5678', 'lfernandez@example.com', 'Heredia, Costa Rica');

INSERT INTO expediente_clinico (id_paciente, observaciones_generales) VALUES
(1, 'Paciente sin antecedentes relevantes.'),
(2, 'Paciente con seguimiento anual.');

INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado, motivo) VALUES
(1, 1, '2026-08-20', '09:00', 'Confirmada', 'Consulta de control anual'),
(2, 1, '2026-08-20', '10:00', 'Programada', 'Primera consulta');

INSERT INTO diagnostico (id_expediente, id_cita, id_medico, descripcion) VALUES
(1, 1, 1, 'Resultados dentro de parámetros normales.');

INSERT INTO tratamiento (id_diagnostico, descripcion, fecha_inicio, indicaciones) VALUES
(1, 'Control preventivo anual', '2026-08-20', 'Reevaluar en 12 meses.');

COMMIT;

-- ============================================================
-- Casos de prueba sugeridos (ver Semana 5 del documento técnico)
-- Ejecutar de forma individual y por separado del bloque anterior.
-- Ambos deben FALLAR por diseño (validan las restricciones de integridad).
-- ============================================================

-- Prueba 1: cédula duplicada -> debe fallar (UNIQUE en paciente.cedula)
-- INSERT INTO paciente (nombre_completo, cedula, fecha_nacimiento)
-- VALUES ('Paciente Duplicada', '1-1111-1111', '1995-01-01');

-- Prueba 2: doble reserva del mismo médico, misma fecha y hora -> debe fallar
-- (UNIQUE en cita(id_medico, fecha_cita, hora_cita))
-- INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, motivo)
-- VALUES (2, 1, '2026-08-20', '09:00', 'Intento de doble reserva');
