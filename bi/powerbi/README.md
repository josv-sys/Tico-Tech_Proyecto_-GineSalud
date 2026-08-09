# Power BI + Power Apps — GineSalud

Power BI (apoyado en Power Apps) se usará para **ingresar/actualizar entidades
administrativas** y para reportes operativos complementarios, según lo definido en la
Semana 3 del documento técnico. Los archivos `.pbix` de Power BI Desktop y las apps de
Power Apps se crean desde sus respectivas herramientas (no por código) — guarda el
`.pbix` en esta carpeta.

## 1. Power BI Desktop — reportes

1. `Inicio` → `Obtener datos` → `Base de datos` → `PostgreSQL`.
2. Servidor: `localhost:5432`, Base de datos: `ginesalud`.
3. Modo de conexión recomendado: **Import** (no DirectQuery) para no golpear la base de
   datos operativa en cada interacción del reporte.
4. Cargar las vistas de `sql/03_views_bi.sql`: `vw_citas_resumen`,
   `vw_indicadores_especialidad`.
5. Programar actualización periódica del dataset (ej. cada 24 horas) desde Power BI
   Service, igual que el extracto de Tableau.

## 2. Power Apps — ingreso de entidades (HU13)

Power BI en sí es de solo lectura; el **ingreso de datos** se hace mediante una app de
**Power Apps** conectada a la misma base PostgreSQL:

1. Crear una **Canvas App** en Power Apps.
2. Agregar el conector de **PostgreSQL** (requiere un *on-premises data gateway* si
   PostgreSQL no es accesible públicamente).
3. Construir formularios sobre las tablas/vistas de catálogo, por ejemplo:
   - `vw_especialidades_catalogo` → alta/edición de especialidades.
   - Catálogo de tratamientos (a definir junto con el equipo clínico).
   - Gestión de usuarios y roles (solo para el rol Administrador).
4. Estos formularios son el mecanismo real que satisface la Historia de Usuario 13
   ("registrar y actualizar catálogos administrativos mediante Power BI/Power Apps").

## 2.1 Nota técnica

Power BI no escribe directamente en la base de datos: solo lee. Power Apps es la pieza que
hace el `INSERT`/`UPDATE` sobre PostgreSQL; Power BI luego refleja esos cambios en sus
reportes al actualizar el dataset. Esta aclaración ya está documentada en la Semana 3 del
documento técnico para evitar confusiones en la defensa del proyecto.

## 3. Dónde guardar el trabajo

- `bi/powerbi/ginesalud_reportes.pbix` — archivo de Power BI Desktop.
- `bi/powerbi/power_apps_notas.md` — capturas/enlaces de la app de Power Apps una vez
  publicada (Power Apps no se descarga como archivo local editable).
