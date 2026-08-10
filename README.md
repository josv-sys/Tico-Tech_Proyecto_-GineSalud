# Proyecto Final — Análisis de Sistemas I (GineSalud)

Guía de entrega para el profesor. Este repositorio contiene el trabajo completo de la
empresa consultora **Tico Tech** para el análisis, planificación y diseño del sistema de
información de la clínica ginecológica **GineSalud**, curso Análisis de Sistemas I
(Universidad Politécnica Internacional, Prof. Ing. José Javier Mata Guerrero).

## 📍 Los 3 productos de entrega — dónde está cada uno

| # | Producto pedido | Dónde está | Enlace directo |
|---|---|---|---|
| 1 | **Documento técnico completo** (PDF, portada, índice, numeración) | Raíz del repo | [`Analisis_de_sistema_documento tecnico.pdf`](./Analisis_de_sistema_documento%20tecnico.pdf) |
| 2 | **Video resumen** del proyecto (máx. 5 min) | Raíz del repo | [`Proyecto Analisis de Sistemas I-20260809_165321-Meeting Recording.mp4`](./Proyecto%20Analisis%20de%20Sistemas%20I-20260809_165321-Meeting%20Recording.mp4) |
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
- [`sql/03_views_bi.sql`](./sql/03_views_bi.sql) — vistas de consumo para Tableau y Power BI (base de la página web del punto anterior).

## Estructura completa del repositorio

```
Tico-Tech_Proyecto_-GineSalud/
├── Analisis_de_sistema_documento tecnico.pdf   # 1. Documento técnico final (PDF)
├── Proyecto Analisis de Sistemas I-...mp4       # 2. Video resumen del proyecto
├── Proyecto_Analisis_Sistemas.tex               # Fuente LaTeX del documento técnico
├── Proyecto final analisis.pdf                  # Pautas/cronograma originales del profesor
├── sql/                                          # Prototipo de base de datos (PostgreSQL, Semana 5)
├── azure-devops/                                 # CSV + instrucciones para el tablero de Azure Boards
└── Diseño Power BI y Power Apps GineSalud/       # Código fuente de la página web (mockup BI/Apps)
```

## Cómo se relaciona todo

1. El **documento técnico** contiene el análisis completo: negocio, SCRUM, historias de
   usuario, arquitectura, diagramas UML, factibilidad, riesgos y métricas.
2. El modelo de datos definido ahí se implementó de verdad en **`/sql`**, probado contra
   PostgreSQL.
3. Esas mismas vistas de datos alimentan conceptualmente el **mockup de Power BI / Power
   Apps**, publicado como la página web enlazada arriba.
4. El trabajo se planificó y siguió con SCRUM en el **tablero de Azure Boards** enlazado
   arriba.
5. El **video resumen** y la **presentación oral** cierran la entrega explicando todo lo
   anterior.
