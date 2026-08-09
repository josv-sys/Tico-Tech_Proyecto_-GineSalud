# Proyecto Final — Análisis de Sistemas I (GineSalud)

Proyecto de la empresa consultora **Tico Tech** para el análisis, planificación y diseño del
sistema de información de la clínica ginecológica **GineSalud**, desarrollado para el curso
Análisis de Sistemas I (Universidad Politécnica Internacional).

## Estructura del repositorio

```
Tico-Tech_Proyecto_-GineSalud/
├── Proyecto_Analisis_Sistemas.tex        # Documento técnico principal (LaTeX)
├── Proyecto final analisis.pdf           # Pautas/cronograma del profesor
├── sql/                                   # Scripts de base de datos (PostgreSQL)
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
   Power BI/Power Apps) se materializan como base de datos real en `/sql` — probado contra
   PostgreSQL 18.
3. La carpeta **`Diseño Power BI y Power Apps GineSalud/`** es el mockup de referencia del
   dashboard de Power BI y del formulario de Power Apps (HU13), usado como guía visual para
   construir el reporte real en Power BI Desktop/Service.

## Ver el diseño publicado

Si GitHub Pages está activado en este repositorio (`Settings` → `Pages`, rama `main`, carpeta
`/ (root)`), el mockup queda disponible en:

`https://josv-sys.github.io/Tico-Tech_Proyecto_-GineSalud/Diseño%20Power%20BI%20y%20Power%20Apps%20GineSalud/`

## Próximos pasos sugeridos

- Completar los diagramas placeholder del `.tex` (Figuras 1 a 8) y el logo de la portada con
  las imágenes reales.
- Ejecutar `/sql` contra una base PostgreSQL (`01_schema.sql` → `02_seed_data.sql` →
  `03_views_bi.sql`) para reproducir el prototipo.
- Conectar Tableau Cloud (subiendo un CSV exportado de las vistas de `/sql`) y Power BI/Power
  Apps para construir los reportes reales a partir del mockup.
- Preparar la presentación oral y el video resumen (Semana 6).
