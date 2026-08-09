# Proyecto Final — Análisis de Sistemas I (GineSalud)

## Estructura del repositorio

```
Analisis de Sistemas/
├── Proyecto_Analisis_Sistemas.tex   # Documento técnico principal (LaTeX)
├── Objetivos_Proyecto_Final.md      # Resumen de objetivos/entregas por semana
├── sql/                              # Scripts de base de datos (PostgreSQL)
│   ├── 01_schema.sql                 # DDL: tablas, llaves foráneas, restricciones, índices
│   ├── 02_seed_data.sql              # Datos de prueba + casos de prueba de integridad
│   └── 03_views_bi.sql               # Vistas de consumo para Tableau y Power BI
├── bi/
│   ├── tableau/README.md             # Guía de conexión y dashboards sugeridos
│   └── powerbi/README.md             # Guía de conexión, reportes y Power Apps (HU13)
└── prototipo/README.md               # Evidencia del prototipo (Semana 5): capturas, video, pruebas
```

## Cómo se relaciona todo

1. El **documento técnico** (`Proyecto_Analisis_Sistemas.tex`) contiene el análisis completo
   (SCRUM, historias de usuario, arquitectura, diagramas, factibilidad, riesgos, métricas).
2. Las **decisiones tomadas ahí** (modelo de datos de la Semana 3, integración con
   Tableau/Power BI) se materializan como código real en `/sql` y `/bi`.
3. La carpeta `/prototipo` reúne la evidencia pedida en la Semana 5 (capturas, video,
   reporte de pruebas) para el entregable final.

## Próximos pasos sugeridos

- Instalar PostgreSQL y ejecutar los scripts de `/sql` (ver `prototipo/README.md`).
- Conectar Tableau Desktop y Power BI Desktop siguiendo los README de `/bi`.
- Completar los diagramas placeholder del `.tex` (Figuras 1 a 8) con las imágenes reales.
- Tomar las capturas/video pendientes en `prototipo/README.md`.
