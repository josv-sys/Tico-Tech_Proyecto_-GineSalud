from pathlib import Path

import psycopg.errors
from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
from pydantic import BaseModel

import db

app = FastAPI(title="GineSalud - Prototipo BI")

FRONTEND_DIR = Path(__file__).resolve().parent.parent / "frontend"


class Especialidad(BaseModel):
    nombre_especialidad: str
    descripcion: str | None = None


class Paciente(BaseModel):
    nombre_completo: str
    cedula: str
    fecha_nacimiento: str
    telefono: str | None = None
    correo: str | None = None
    direccion: str | None = None


class Cita(BaseModel):
    id_paciente: int
    id_medico: int
    fecha_cita: str
    hora_cita: str
    estado: str = "Programada"
    motivo: str | None = None


def run_insert(sql: str, params: tuple):
    try:
        return db.execute(sql, params)
    except psycopg.errors.UniqueViolation as exc:
        raise HTTPException(status_code=409, detail=str(exc.diag.message_primary)) from exc
    except psycopg.errors.CheckViolation as exc:
        raise HTTPException(status_code=422, detail=str(exc.diag.message_primary)) from exc


# ---------- Catálogos ----------

@app.get("/api/especialidades")
def listar_especialidades():
    return db.query("SELECT * FROM vw_especialidades_catalogo ORDER BY id_especialidad")


@app.post("/api/especialidades", status_code=201)
def crear_especialidad(item: Especialidad):
    return run_insert(
        """
        INSERT INTO especialidad (nombre_especialidad, descripcion)
        VALUES (%s, %s) RETURNING id_especialidad, nombre_especialidad, descripcion
        """,
        (item.nombre_especialidad, item.descripcion),
    )


@app.get("/api/medicos")
def listar_medicos():
    return db.query(
        """
        SELECT m.id_medico, m.nombre_completo, e.nombre_especialidad AS especialidad
        FROM medico m
        JOIN especialidad e ON e.id_especialidad = m.id_especialidad
        WHERE m.activo
        ORDER BY m.nombre_completo
        """
    )


# ---------- Pacientes ----------

@app.get("/api/pacientes")
def listar_pacientes():
    return db.query("SELECT * FROM paciente ORDER BY id_paciente DESC")


@app.post("/api/pacientes", status_code=201)
def crear_paciente(item: Paciente):
    row = run_insert(
        """
        INSERT INTO paciente (nombre_completo, cedula, fecha_nacimiento, telefono, correo, direccion)
        VALUES (%s, %s, %s, %s, %s, %s)
        RETURNING id_paciente, nombre_completo, cedula, fecha_nacimiento, telefono, correo, direccion
        """,
        (item.nombre_completo, item.cedula, item.fecha_nacimiento, item.telefono, item.correo, item.direccion),
    )
    db.execute(
        "INSERT INTO expediente_clinico (id_paciente) VALUES (%s)",
        (row["id_paciente"],),
    )
    return row


# ---------- Citas ----------

@app.get("/api/citas")
def listar_citas():
    return db.query("SELECT * FROM vw_citas_resumen ORDER BY fecha_cita DESC, hora_cita DESC LIMIT 100")


@app.post("/api/citas", status_code=201)
def crear_cita(item: Cita):
    return run_insert(
        """
        INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado, motivo)
        VALUES (%s, %s, %s, %s, %s, %s)
        RETURNING id_cita, id_paciente, id_medico, fecha_cita, hora_cita, estado, motivo
        """,
        (item.id_paciente, item.id_medico, item.fecha_cita, item.hora_cita, item.estado, item.motivo),
    )


# ---------- Reportería (equivalente a los dashboards de Tableau / Power BI) ----------

@app.get("/api/reportes/indicadores")
def reporte_indicadores():
    return db.query("SELECT * FROM vw_indicadores_especialidad ORDER BY especialidad")


@app.get("/api/reportes/resumen")
def reporte_resumen():
    rows = db.query(
        """
        SELECT
            COUNT(*) AS total_citas,
            COUNT(*) FILTER (WHERE estado = 'Atendida')   AS citas_atendidas,
            COUNT(*) FILTER (WHERE estado = 'Cancelada')  AS citas_canceladas,
            COUNT(*) FILTER (WHERE estado = 'Programada') AS citas_programadas,
            COUNT(*) FILTER (WHERE estado = 'Confirmada') AS citas_confirmadas
        FROM cita
        """
    )
    resumen = rows[0]
    total = resumen["total_citas"] or 0
    resumen["porcentaje_atendidas"] = round(100 * resumen["citas_atendidas"] / total, 1) if total else 0.0
    return resumen


# ---------- Frontend estático ----------

@app.get("/")
def index():
    return FileResponse(FRONTEND_DIR / "index.html")
