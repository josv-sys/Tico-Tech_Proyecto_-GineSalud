# Proyecto Final — Análisis de Sistemas I (GineSalud)

Guía de entrega para el profesor. Este repositorio contiene el trabajo completo de la
empresa consultora **Tico Tech** para el análisis, planificación y diseño del sistema de
información de la clínica ginecológica **GineSalud**, curso Análisis de Sistemas I
(Universidad Politécnica Internacional, Prof. Ing. José Javier Mata Guerrero).

## 📍 Los 3 productos de entrega — dónde está cada uno

| # | Producto pedido | Dónde está | Enlace directo |
|---|---|---|---|
| 1 | **Documento técnico completo** (PDF, portada, índice, numeración) | Raíz del repo | [`Documento_Tecnico_GineSalud.pdf`](./Documento_Tecnico_GineSalud.pdf) |
| 2 | **Video resumen** del proyecto (máx. 5 min) | Raíz del repo | [`Video_Resumen_GineSalud.mp4`](./Video_Resumen_GineSalud.mp4) |
| 3 | **Presentación oral con cámara** | Se realiza en vivo en clase (no aplica archivo en el repo) | — |

> El PDF se generó a partir de la fuente en LaTeX [`Proyecto_Analisis_Sistemas.tex`](./Proyecto_Analisis_Sistemas.tex),
> incluida también en el repo por si se necesita revisar o recompilar el documento.

## 🌐 Página web del proyecto (mockup Power BI / Power Apps)

El prototipo de interfaz (dashboard de Power BI + formulario de Power Apps del catálogo
de especialidades, HU13) está publicado como página web con GitHub Pages:

**https://josv-sys.github.io/Tico-Tech_Proyecto_-GineSalud/Dise%C3%B1o%20Power%20BI%20y%20Power%20Apps%20GineSalud/**

Es un mockup de referencia (no está conectado a una base de datos en vivo): muestra las
métricas de citas del proyecto (total de citas, % atendidas, citas por especialidad) y un
formulario de alta/edición de especialidades. El código fuente está en la carpeta
[`Diseño Power BI y Power Apps GineSalud/`](./Diseño%20Power%20BI%20y%20Power%20Apps%20GineSalud/).

## 📋 Tablero SCRUM / Azure Boards

El backlog, las historias de usuario y el tablero SCRUM del proyecto se gestionan en
Azure DevOps:

**https://dev.azure.com/jvillarreals/Tico%20Tech_Proyecto_%20GineSalud/_workitems/recentlyupdated/**

El CSV usado para poblar ese tablero, junto con las instrucciones de importación, está en
[`azure-devops/`](./azure-devops/).

## 🗄️ Prototipo de base de datos (Semana 5)

El modelo de datos definido en el documento técnico se implementó y probó en PostgreSQL:

- [`sql/01_schema.sql`](./sql/01_schema.sql) — tablas, llaves foráneas, restricciones, índices.
- [`sql/02_seed_data.sql`](./sql/02_seed_data.sql) — datos de prueba y casos de prueba de integridad.
- [`sql/03_views_bi.sql`](./sql/03_views_bi.sql) — vistas de consumo para Tableau y Power BI (base de la página web y del prototipo funcional).

## 🖥️ Prototipo funcional local (base de datos real)

Además del mockup estático de GitHub Pages, [`prototipo-web/`](./prototipo-web/) es una
versión que corre en la computadora, conectada a un PostgreSQL real (vía Docker) con el
esquema de `/sql` cargado: se pueden agregar pacientes, citas y especialidades desde un
formulario y los gráficos de reportería se actualizan al instante con los datos reales de
la base. Instrucciones para levantarlo en [`prototipo-web/README.md`](./prototipo-web/README.md).

## 📊 Excel de cronograma, presupuesto y ruta crítica

[`GineSalud_Cronograma_Presupuesto_RutaCritica.xlsx`](./GineSalud_Cronograma_Presupuesto_RutaCritica.xlsx)
reúne en un solo libro, con fórmulas reales (no valores pegados), la justificación
numérica del proyecto pedida en las Semanas 1 y 4:

- **Cronograma** — las 6 semanas del curso y qué se entregó en cada una.
- **Presupuesto** — presupuesto original (Semana 1), ajustado (Semana 3) y licenciamiento referencial de BI.
- **Story Points** — esfuerzo estimado de las historias de usuario.
- **Ruta Crítica (CPM)** — inicio/fin más temprano y más tardío y holgura por tarea, calculados con fórmulas de Excel (T1 → T3 → T4 → T6, 35 días hábiles).
- **Recursos** — distribución de las 640 horas del proyecto entre los integrantes del equipo.
- **Riesgos** — matriz de riesgos con severidad calculada (probabilidad × impacto).
- **Métricas de éxito** — indicadores clave para evaluar el sistema.

## Estructura completa del repositorio

```
Tico-Tech_Proyecto_-GineSalud/
├── Documento_Tecnico_GineSalud.pdf               # 1. Documento técnico final (PDF)
├── Video_Resumen_GineSalud.mp4                   # 2. Video resumen del proyecto
├── GineSalud_Cronograma_Presupuesto_RutaCritica.xlsx  # Excel de cronograma/presupuesto/ruta crítica
├── Proyecto_Analisis_Sistemas.tex               # Fuente LaTeX del documento técnico
├── Instrucciones_Profesor.pdf                    # Pautas/cronograma originales del profesor (no es un entregable)
├── sql/                                          # Prototipo de base de datos (PostgreSQL, Semana 5)
├── azure-devops/                                 # CSV + instrucciones para el tablero de Azure Boards
├── Diseño Power BI y Power Apps GineSalud/       # Código fuente de la página web (mockup BI/Apps, GitHub Pages)
└── prototipo-web/                                # Prototipo funcional local (FastAPI + PostgreSQL real)
```

## Cómo se relaciona todo

1. El **documento técnico** contiene el análisis completo: negocio, SCRUM, historias de
   usuario, arquitectura, diagramas UML, factibilidad, riesgos y métricas.
2. El modelo de datos definido ahí se implementó de verdad en **`/sql`**, probado contra
   PostgreSQL.
3. Esas mismas vistas de datos alimentan conceptualmente el **mockup de Power BI / Power
   Apps** publicado en GitHub Pages, y de verdad al **prototipo funcional local**
   (`prototipo-web/`), que sí lee y escribe en PostgreSQL.
4. El trabajo se planificó y siguió con SCRUM en el **tablero de Azure Boards** enlazado
   arriba.
5. El **video resumen** y la **presentación oral** cierran la entrega explicando todo lo
   anterior.
