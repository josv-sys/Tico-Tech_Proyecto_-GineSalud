-- ============================================================
-- GineSalud - Vistas para consumo desde Tableau y Power BI
-- Ejecutar después de 01_schema.sql (y opcionalmente 02_seed_data.sql)
-- ============================================================

-- Vista resumen de citas: fuente principal para dashboards de Tableau
-- (agenda por médico, estado de citas, especialidad).
CREATE OR REPLACE VIEW vw_citas_resumen AS
SELECT
    c.id_cita,
    c.fecha_cita,
    c.hora_cita,
    c.estado,
    p.id_paciente,
    p.nombre_completo AS paciente,
    m.id_medico,
    m.nombre_completo AS medico,
    e.nombre_especialidad AS especialidad
FROM cita c
JOIN paciente p   ON p.id_paciente = c.id_paciente
JOIN medico m     ON m.id_medico = c.id_medico
JOIN especialidad e ON e.id_especialidad = m.id_especialidad;

-- Indicadores agregados por especialidad: soporta HU6, HU8 y HU12
-- (reportes e indicadores de atención en Tableau).
CREATE OR REPLACE VIEW vw_indicadores_especialidad AS
SELECT
    e.nombre_especialidad AS especialidad,
    COUNT(c.id_cita) AS total_citas,
    COUNT(*) FILTER (WHERE c.estado = 'Atendida')   AS citas_atendidas,
    COUNT(*) FILTER (WHERE c.estado = 'Cancelada')  AS citas_canceladas,
    COUNT(*) FILTER (WHERE c.estado = 'Programada') AS citas_programadas
FROM cita c
JOIN medico m ON m.id_medico = c.id_medico
JOIN especialidad e ON e.id_especialidad = m.id_especialidad
GROUP BY e.nombre_especialidad;

-- Catálogo de especialidades expuesto para edición desde Power BI / Power Apps
-- (soporta HU13: ingreso y actualización de catálogos administrativos).
CREATE OR REPLACE VIEW vw_especialidades_catalogo AS
SELECT id_especialidad, nombre_especialidad, descripcion
FROM especialidad;
