# Tableau — GineSalud

Tableau se usará para **representar** la información (dashboards e indicadores), según lo
definido en la Semana 3 del documento técnico.

## 0. Importante: tienen Tableau Cloud (web, vía Salesforce), no Tableau Desktop

Desde que Salesforce adquirió Tableau, la versión web se llama **Tableau Cloud** (antes
"Tableau Online") y se administra desde el portal de Salesforce/Tableau. Al no tener
Tableau Desktop instalado, hay dos formas de conectar datos:

| Opción | Cómo funciona | Cuándo usarla |
|---|---|---|
| **A. Subir CSV/Excel directamente** | Se sube un archivo de datos "congelado" (foto del momento) directo desde el navegador de Tableau Cloud, sin instalar nada | La más simple para este proyecto — es la que usaremos ahora |
| **B. Tableau Bridge** | Programa liviano que se instala en esta PC y mantiene una conexión en vivo/programada entre el PostgreSQL local y Tableau Cloud | Si más adelante quieren que el dashboard se actualice solo, sin volver a exportar CSV a mano |

Para este entregable usamos la **Opción A**, que ya está lista:

1. Ya se exportaron los datos de las vistas a CSV, ejecutando `sql/03_views_bi.sql` contra
   la base `ginesalud` y copiando el resultado con `\COPY ... TO ... CSV HEADER`:
   - `bi/tableau/vw_citas_resumen.csv`
   - `bi/tableau/vw_indicadores_especialidad.csv`
2. En Tableau Cloud (navegador): `Inicio` → `Nuevo` → `Origen de datos` → `Archivo de texto`
   (o arrastrar el `.csv` directamente al área de "Conectar").
3. Subir `vw_citas_resumen.csv` y `vw_indicadores_especialidad.csv` como dos orígenes de
   datos (o unirlos por `id_medico`/`especialidad` si se quiere un solo origen).
4. Desde ahí, crear las hojas y el dashboard directamente en el editor web de Tableau
   Cloud (misma lógica que Tableau Desktop, pero en el navegador).

> **Nota:** al ser un archivo subido, los datos quedan fijos hasta que se vuelva a
> exportar y subir un CSV actualizado (ej. re-ejecutando el `\COPY` cada vez que cambien
> los datos de prueba). Para producción real (con datos vivos de la clínica) se
> recomienda pasar a la Opción B (Tableau Bridge) o a un conector nativo de PostgreSQL si
> en algún momento se dispone de Tableau Desktop.

## 2. Dashboards sugeridos (alineados a las historias de usuario y KPIs)

| Dashboard | Historia de Usuario / Métrica relacionada | Contenido sugerido |
|---|---|---|
| Estado de citas | HU6, HU8 | Conteo de citas por estado (Programada, Confirmada, Cancelada, Atendida) |
| Citas por especialidad | HU8, HU12 | Barras de `vw_indicadores_especialidad` |
| Agenda por médico | HU10 | Tabla/calendario de `vw_citas_resumen` filtrable por médico y fecha |
| Tendencia de citas en el tiempo | Métrica: adopción del sistema (Semana 4) | Línea de tiempo de citas creadas por semana/mes |

## 3. Rendimiento

Para evitar que los dashboards impacten la base de datos operativa (ver "Análisis de
rendimiento" de la Semana 5), usar **extractos de Tableau** (`.hyper`) con actualización
programada (por ejemplo, cada 24 horas) en lugar de conexión en vivo permanente.

## 4. Dónde guardar el trabajo

Guardar el archivo `.twbx` (empaquetado, incluye el extracto) en esta misma carpeta, por
ejemplo: `bi/tableau/ginesalud_dashboards.twbx`.
