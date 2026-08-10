# Prototipo web — GineSalud (reportería en vivo)

Versión funcional del prototipo de la Semana 5: en vez del mockup estático de
`Diseño Power BI y Power Apps GineSalud/` (sin datos reales), esta carpeta levanta la
base de datos PostgreSQL real definida en `/sql`, un backend en Python (FastAPI) que la
consulta, y una página web que agrega datos y refresca la reportería al instante.

Respeta la arquitectura cliente-servidor de tres capas del documento técnico (Semana 3):
**Presentación** (`frontend/index.html`) → **Lógica de negocio** (`backend/`, Python) →
**Datos** (PostgreSQL, vía Docker).

## Requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (para levantar PostgreSQL sin instalarlo a mano).
- Python 3.11+ instalado en el sistema.

## 1. Levantar la base de datos

```bash
cd prototipo-web
docker compose up -d
```

Esto crea un contenedor `ginesalud_db` con PostgreSQL 18, cargando automáticamente
`sql/01_schema.sql`, `sql/02_seed_data.sql` y `sql/03_views_bi.sql` (el mismo esquema y
datos de prueba del documento técnico). Queda expuesto en `localhost:5433` (no 5432, por
si ya tienes un PostgreSQL nativo corriendo en ese puerto).

## 2. Levantar el backend

```bash
cd prototipo-web/backend
python -m venv .venv
.venv\Scripts\pip install -r requirements.txt      # Windows (PowerShell/cmd)
# source .venv/bin/activate && pip install -r requirements.txt   # macOS/Linux

.venv\Scripts\python -m uvicorn main:app --reload --port 8000
```

Variables de conexión (opcionales, ya traen estos valores por defecto — coinciden con
`docker-compose.yml`): `PGHOST=localhost`, `PGPORT=5433`, `PGDATABASE=ginesalud`,
`PGUSER=ginesalud`, `PGPASSWORD=ginesalud`.

## 3. Abrir la página

**http://localhost:8000**

El backend sirve el frontend directamente (no hace falta un segundo servidor). Desde ahí
puedes:

- Ver el dashboard (equivalente a Power BI): total de citas, % atendidas, citas por
  especialidad, distribución de estados — todo calculado con las vistas de
  `sql/03_views_bi.sql`.
- Agendar una cita, registrar un paciente o agregar una especialidad (equivalente al
  formulario de Power Apps de HU13) — cada envío escribe en PostgreSQL de verdad y los
  gráficos se refrescan solos.
- Comprobar las reglas de integridad del documento técnico en vivo: registrar la misma
  cédula dos veces, o agendar dos citas para el mismo médico en la misma fecha/hora,
  devuelve un error 409 en vez de guardarse (son las mismas restricciones `UNIQUE`
  probadas en la Semana 5 con `sql/02_seed_data.sql`).

## Estructura

```
prototipo-web/
├── docker-compose.yml     # PostgreSQL 18 con el esquema real precargado
├── backend/
│   ├── main.py             # Endpoints FastAPI (CRUD + reportería)
│   ├── db.py                # Conexión a PostgreSQL (psycopg 3)
│   └── requirements.txt
└── frontend/
    └── index.html           # Dashboard + formularios (HTML/JS + Chart.js, sin build)
```

## Por qué no es Tableau/Power BI real

El documento técnico define Tableau y Power BI como las herramientas de BI del proyecto,
conectadas de solo lectura a PostgreSQL. Esta página cumple ese mismo rol para poder
hacer una demo 100% local sin licencias ni cuentas — reemplaza la reportería visual, no
la arquitectura de datos: sigue leyendo de las mismas vistas SQL (`vw_indicadores_especialidad`,
`vw_citas_resumen`, `vw_especialidades_catalogo`) que se diseñaron para Tableau/Power BI.
