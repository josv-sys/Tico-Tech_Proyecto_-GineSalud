-- ============================================================
-- GineSalud - Sistema de Gestión Clínica
-- Esquema de base de datos (PostgreSQL)
-- Proyecto: Análisis de Sistemas I - Tico Tech / GineSalud
-- Basado en el diagrama de clases definido en la Semana 3
-- ============================================================

BEGIN;

-- ---------- Catálogos ----------

CREATE TABLE rol (
    id_rol              SERIAL PRIMARY KEY,
    nombre_rol          VARCHAR(50) NOT NULL UNIQUE,
    descripcion         VARCHAR(255)
);

CREATE TABLE especialidad (
    id_especialidad     SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    descripcion         VARCHAR(255)
);

-- ---------- Usuarios y personal ----------

CREATE TABLE usuario (
    id_usuario          SERIAL PRIMARY KEY,
    nombre_usuario       VARCHAR(50) NOT NULL UNIQUE,
    correo               VARCHAR(150) NOT NULL UNIQUE,
    password_hash        VARCHAR(255) NOT NULL,
    id_rol               INTEGER NOT NULL REFERENCES rol(id_rol),
    activo                BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion        TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE medico (
    id_medico            SERIAL PRIMARY KEY,
    nombre_completo       VARCHAR(150) NOT NULL,
    id_especialidad       INTEGER NOT NULL REFERENCES especialidad(id_especialidad),
    id_usuario            INTEGER UNIQUE REFERENCES usuario(id_usuario),
    telefono              VARCHAR(20),
    correo                VARCHAR(150),
    activo                BOOLEAN NOT NULL DEFAULT TRUE
);

-- ---------- Pacientes y expedientes ----------

CREATE TABLE paciente (
    id_paciente          SERIAL PRIMARY KEY,
    nombre_completo       VARCHAR(150) NOT NULL,
    cedula                VARCHAR(20) NOT NULL UNIQUE,
    fecha_nacimiento      DATE NOT NULL,
    telefono              VARCHAR(20),
    correo                VARCHAR(150),
    direccion             VARCHAR(255),
    fecha_registro        TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE expediente_clinico (
    id_expediente         SERIAL PRIMARY KEY,
    id_paciente           INTEGER NOT NULL UNIQUE REFERENCES paciente(id_paciente),
    fecha_apertura        TIMESTAMP NOT NULL DEFAULT NOW(),
    observaciones_generales TEXT
);

-- ---------- Citas ----------

CREATE TABLE cita (
    id_cita               SERIAL PRIMARY KEY,
    id_paciente           INTEGER NOT NULL REFERENCES paciente(id_paciente),
    id_medico             INTEGER NOT NULL REFERENCES medico(id_medico),
    fecha_cita            DATE NOT NULL,
    hora_cita             TIME NOT NULL,
    estado                VARCHAR(20) NOT NULL DEFAULT 'Programada'
                              CHECK (estado IN ('Programada','Confirmada','Cancelada','Atendida')),
    motivo                VARCHAR(255),
    fecha_creacion        TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_medico_horario UNIQUE (id_medico, fecha_cita, hora_cita)
);

-- ---------- Diagnósticos y tratamientos ----------

CREATE TABLE diagnostico (
    id_diagnostico        SERIAL PRIMARY KEY,
    id_expediente         INTEGER NOT NULL REFERENCES expediente_clinico(id_expediente),
    id_cita                INTEGER REFERENCES cita(id_cita),
    id_medico              INTEGER NOT NULL REFERENCES medico(id_medico),
    descripcion             TEXT NOT NULL,
    fecha_diagnostico       TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE tratamiento (
    id_tratamiento          SERIAL PRIMARY KEY,
    id_diagnostico          INTEGER NOT NULL REFERENCES diagnostico(id_diagnostico),
    descripcion               TEXT NOT NULL,
    fecha_inicio               DATE NOT NULL,
    fecha_fin                  DATE,
    indicaciones                TEXT,
    CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

-- ---------- Índices de apoyo (ver análisis de rendimiento, Semana 5) ----------

CREATE INDEX idx_cita_fecha ON cita(fecha_cita);
CREATE INDEX idx_cita_paciente ON cita(id_paciente);
CREATE INDEX idx_cita_medico ON cita(id_medico);
CREATE INDEX idx_diagnostico_expediente ON diagnostico(id_expediente);

COMMIT;
