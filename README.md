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
| 3 | Diagramas (actividad, clases, despliegue), refinamiento de arquitectura, factibilidad técnica/económica, herramientas concretas | ✅ Texto completo — faltan las 3 imágenes de los diagramas |
| 4 | Ruta crítica, estimación de tiempos/recursos, análisis de riesgos, métricas clave | ✅ Completo |
| 5 | Prototipo funcional, pruebas iniciales, análisis de rendimiento, mejoras de interfaz | ✅ Prototipo SQL ejecutado y probado — faltan capturas/mockup de interfaz |
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

| # | Placeholder | Cómo resolverlo |
|---|---|---|
| 1 | Logo de la Universidad (portada) | Agregar el logo real de UPI como imagen |
| 2 | Figura 1 — Arquitectura del sistema | Diagrama de cajas (Presentación / Lógica / Datos / Tableau-PowerBI) |
| 3 | Figura 2 — Diagrama de casos de uso | UML: actores Recepcionista/Ginecólogo/Administrador + HU1-HU13 |
| 4 | Captura del tablero Azure Boards | Screenshot real del Sprint en Azure DevOps |
| 5 | Figura 3 — Diagrama de actividad | Flujo "Registrar y confirmar cita médica" |
| 6 | Figura 4 — Diagrama de clases | Entidades del `01_schema.sql` (Paciente, Cita, Médico, etc.) |
| 7 | Figura 5 — Diagrama de despliegue | Cliente / Servidor Django / PostgreSQL / Tableau / Power BI |
| 8 | Figura 6 — Diagrama de red/Gantt de la ruta crítica | Basado en la Tabla de ruta crítica (T1→T3→T4→T6, Semana 4) |
| 9 | Figura 7 — Mockups de interfaz | Wireframes de registro de paciente, agenda, expediente |
| 10 | Figura 8 — Captura del prototipo funcional | Screenshot de pgAdmin (tablas de `ginesalud`) + del mockup de Power BI/Power Apps |

> Los placeholders 1, 4, 9 y 10 solo necesitan una imagen/screenshot real (no requieren
> diseño nuevo — el 10 ya se puede tomar ahora mismo desde pgAdmin y desde el mockup
> publicado arriba). Los placeholders 2, 3, 5, 6, 7 y 8 requieren dibujar el diagrama
> correspondiente (a mano, en draw.io/Lucidchart, o generado en LaTeX/TikZ).

## Próximos pasos sugeridos

- Resolver los placeholders de la tabla anterior y recompilar el `.tex` a PDF.
- Subir el PDF compilado a este repositorio y enlazarlo arriba, en "Documento técnico".
- Preparar la presentación oral y el video resumen (Semana 6).
