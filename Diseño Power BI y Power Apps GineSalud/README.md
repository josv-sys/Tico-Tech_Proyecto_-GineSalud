# Diseño Power BI y Power Apps — GineSalud

Mockup de referencia (no funcional/conectado a datos en vivo) de:

1. Un **dashboard estilo Power BI** con las métricas de citas del proyecto GineSalud
   (citas totales, % atendidas, estado de citas, citas por especialidad).
2. Un **formulario estilo Power Apps** para el catálogo de especialidades (HU13),
   que es el mecanismo real que permite ingresar/actualizar entidades administrativas
   descrito en la Semana 3 del documento técnico (`Proyecto_Analisis_Sistemas.tex`).

Generado con Claude a partir del prompt documentado en la conversación del proyecto,
usando los datos reales del prototipo en `/sql` y `/bi`.

## Ver el diseño

Abrir `index.html` en un navegador, o visitar la versión publicada en GitHub Pages de
este repositorio (ver el README principal del proyecto para el enlace).

## Archivos

- `index.html` — el diseño; GitHub Pages lo sirve automáticamente al publicar esta carpeta.
- `support.js` — motor de renderizado del canvas (carga React desde una CDN pública).

> Nota: `ginesalud_bi_apps.html` no se subió a este repositorio porque es un
> "loader" que depende de la infraestructura de Claude para resolver su contenido — no
> funciona como página estática independiente.
