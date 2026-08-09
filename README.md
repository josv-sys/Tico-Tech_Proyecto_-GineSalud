# Proyecto Final — Análisis de Sistemas I (GineSalud)

Proyecto de la empresa consultora **Tico Tech** para el análisis, planificación y diseño del
sistema de información de la clínica ginecológica **GineSalud**, desarrollado para el curso
Análisis de Sistemas I (Universidad Politécnica Internacional, Prof. Ing. José Javier Mata
Guerrero).

## Documento técnico

- **Fuente LaTeX**: [`Proyecto_Analisis_Sistemas.tex`](./Proyecto_Analisis_Sistemas.tex)
- **PDF compilado**: _(agregar aquí el enlace o subir el PDF al repo cuando esté compilado)_

## Qué pide el profesor (`Proyecto final analisis.pdf`)

Al final del curso se deben entregar **3 productos**:

1. **Documento técnico completo** — PDF con portada, índice y numeración de páginas.
2. **Presentación oral** con cámara encendida — participan todos los integrantes.
3. **Video resumen** del proyecto (máx. 5 minutos).

Cronograma de contenido por semana:

| Semana | Contenido exigido | Estado en este repo |
|---|---|---|
| 1 | Negocio, SCRUM (roles/tablero/backlog), historias de usuario, presupuesto, story points, arquitectura, primeros UML | ✅ Completo |
| 2 | Requisitos funcionales/no funcionales, historias adicionales, caso de uso mejorado, roles y permisos, stack técnico, tablero SCRUM | ✅ Completo |
| 3 | Diagramas (actividad, clases, despliegue), refinamiento de arquitectura, factibilidad técnica/económica, herramientas concretas | ✅ Completo (diagramas generados en TikZ) |
| 4 | Ruta crítica, estimación de tiempos/recursos, análisis de riesgos, métricas clave | ✅ Completo |
| 5 | Prototipo funcional, pruebas iniciales, análisis de rendimiento, mejoras de interfaz | ✅ Prototipo SQL ejecutado y probado — falta la captura de evidencia |
| 6 | Entrega final (PDF), presentación oral, video resumen, defensa | ⬜ Pendiente |

## Estructura del repositorio

```
Tico-Tech_Proyecto_-GineSalud/
├── Proyecto_Analisis_Sistemas.tex        # Documento técnico principal (LaTeX)
├── Proyecto final analisis.pdf           # Pautas/cronograma del profesor
├── sql/                                   # Scripts de base de datos (PostgreSQL) — prototipo Semana 5
│   ├── 01_schema.sql                      # DDL: tablas, llaves foráneas, restricciones, índices
│   ├── 02_seed_data.sql                   # Datos de prueba + casos de prueba de integridad
│   └── 03_views_bi.sql                    # Vistas de consumo para Tableau y Power BI
└── Diseño Power BI y Power Apps GineSalud/ # Mockup de referencia (dashboard + formulario)
    ├── index.html                          # Diseño autocontenido (se abre directo en el navegador)
    ├── GineSalud PowerBI y PowerApps.dc.html
    ├── support.js
    └── README.md
```

## Cómo se relaciona todo

1. El **documento técnico** (`Proyecto_Analisis_Sistemas.tex`) contiene el análisis completo:
   SCRUM, historias de usuario, arquitectura, diagramas UML, factibilidad, riesgos y métricas
   (Semanas 1 a 5).
2. Las decisiones tomadas ahí (modelo de datos de la Semana 3, integración con Tableau y
   Power BI/Power Apps) se materializan como base de datos real en `/sql` — creada, cargada
   y probada contra PostgreSQL 18 (ver la tabla "Reporte de pruebas iniciales" en la Semana 5
   del documento).
3. La carpeta **`Diseño Power BI y Power Apps GineSalud/`** es el mockup de referencia del
   dashboard de Power BI y del formulario de Power Apps (HU13), citado directamente desde la
   Semana 5 del documento técnico.

## Ver el diseño publicado

Si GitHub Pages está activado en este repositorio (`Settings` → `Pages`, rama `main`, carpeta
`/ (root)`), el mockup queda disponible en:

`https://josv-sys.github.io/Tico-Tech_Proyecto_-GineSalud/Diseño%20Power%20BI%20y%20Power%20Apps%20GineSalud/`

## Placeholders que faltan en el `.tex` antes de compilar el PDF final

Las Figuras 1 a 5 (arquitectura, casos de uso, actividad, clases, despliegue) ya se
generaron directamente en TikZ dentro del `.tex` — no requieren imagen externa. Solo
quedan **3 capturas de pantalla** por tomar:

| # | Placeholder | Dónde tomarla |
|---|---|---|
| 1 | Logo de la Universidad (portada) | Sitio de la UPI, o pedirlo al profesor |
| 2 | Captura del tablero Azure Boards | Tu proyecto de Azure DevOps, una vez importado `azure-devops/ginesalud_backlog.csv` |
| 3 | Figura 6 — Captura del prototipo funcional | pgAdmin (tablas de `ginesalud`) + el mockup publicado de Power BI/Power Apps |

> Los diagramas TikZ no se pudieron compilar/verificar en el entorno donde se generaron
> (no había instalación de LaTeX disponible). Si al compilar aparece algún error,
> revisar primero el bloque `tikzpicture` de la figura señalada por el número de línea
> del error.

## Próximos pasos sugeridos

- Resolver los placeholders de la tabla anterior y recompilar el `.tex` a PDF.
- Subir el PDF compilado a este repositorio y enlazarlo arriba, en "Documento técnico".
- Preparar la presentación oral y el video resumen (Semana 6).
