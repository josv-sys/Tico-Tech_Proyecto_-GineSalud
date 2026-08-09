# Prototipo funcional — Semana 5

Evidencia del prototipo funcional del sistema GineSalud, según lo pedido en la Semana 5
del cronograma del profesor (*"Capturas o video del prototipo funcional y reporte de
pruebas"*).

## Alcance del prototipo

Dado que este es un curso de **Análisis de Sistemas** (no de desarrollo completo), el
prototipo funcional corresponde a:

1. El modelo de datos relacional implementado en PostgreSQL (`/sql/01_schema.sql`),
   construido a partir del diagrama de clases de la Semana 3.
2. Datos de prueba cargados (`/sql/02_seed_data.sql`).
3. Las vistas de integración con Tableau y Power BI (`/sql/03_views_bi.sql`),
   conectadas y mostrando datos reales en al menos un dashboard de cada herramienta
   (ver `/bi/tableau` y `/bi/powerbi`).

## Estado (actualizado 2026-08-09)

- [x] Base de datos `ginesalud` creada en PostgreSQL 18 local.
- [x] `01_schema.sql` ejecutado — 9 tablas + 4 índices creados sin errores.
- [x] `02_seed_data.sql` ejecutado — datos de prueba cargados (roles, especialidades,
      usuarios, 1 médico, 2 pacientes, expedientes, 2 citas, 1 diagnóstico/tratamiento).
- [x] `03_views_bi.sql` ejecutado — 3 vistas creadas y devolviendo datos correctos.
- [x] Pruebas de integridad validadas contra la base real:
      cédula duplicada, doble reserva de horario y borrado de especialidad referenciada
      fallan como se esperaba (ver detalle en la Semana 5 del documento técnico).
- [ ] Captura de pantalla de las tablas creadas en pgAdmin (refrescar
      `ginesalud → Schemas → public → Tables`).
- [ ] Captura de pantalla del dashboard de Tableau conectado a `vw_indicadores_especialidad`.
- [ ] Captura de pantalla del reporte de Power BI y del formulario de Power Apps (HU13).
- [ ] Video corto (o GIF) mostrando el flujo: registrar cita → aparece en el dashboard.

## Cómo levantar el prototipo localmente

### Opción A — Línea de comandos (psql)

```bash
# 1. Crear la base de datos
createdb ginesalud

# 2. Ejecutar los scripts en orden
psql -d ginesalud -f ../sql/01_schema.sql
psql -d ginesalud -f ../sql/02_seed_data.sql
psql -d ginesalud -f ../sql/03_views_bi.sql

# 3. Verificar
psql -d ginesalud -c "SELECT * FROM vw_citas_resumen;"
```

### Opción B — pgAdmin 4 (interfaz gráfica)

1. En **Object Explorer**, clic derecho en `Databases` → `Create` → `Database...` → nombre
   `ginesalud` → `Save`.
2. Clic en la base `ginesalud` para seleccionarla, luego clic derecho → `Query Tool`
   (verificar que la pestaña diga `ginesalud/postgres@...`, **no** `postgres/postgres@...`).
3. Abrir `sql/01_schema.sql`, pegar su contenido en el Query Tool y ejecutar (▶ o F5).
4. Repetir con `sql/02_seed_data.sql` y `sql/03_views_bi.sql`, en ese orden, sobre la
   misma base `ginesalud`.
5. Refrescar `Databases → ginesalud → Schemas → public → Tables` para ver las 9 tablas
   creadas.

> **Error común:** `relation "rol" already exists` casi siempre significa que el Query Tool
> está apuntando a la base equivocada (por ejemplo, `postgres` en lugar de `ginesalud`) y
> ya se corrió el script ahí antes. Verificar el nombre de la base en la pestaña del Query
> Tool antes de ejecutar.
