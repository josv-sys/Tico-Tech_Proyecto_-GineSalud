# Importar el backlog a Azure Boards

No hay forma de conectarse a Azure DevOps automáticamente desde aquí (no hay plugin/API
disponible en este entorno), pero Azure Boards tiene un importador nativo de CSV que deja
el tablero poblado en menos de un minuto.

## Pasos

1. En tu proyecto de Azure DevOps (`Tico Tech_Proyecto_ GineSalud`), ve a **Boards** →
   **Work Items**.
2. Clic en el menú **"..."** (arriba a la derecha) → **Import Work Items**.
3. Arrastra o selecciona el archivo [`ginesalud_backlog.csv`](./ginesalud_backlog.csv) de
   esta carpeta.
4. Azure te va a mostrar una vista previa mapeando las columnas del CSV a los campos del
   work item (`Work Item Type`, `Title`, `State`, `Tags`, `Description`). Si el mapeo
   automático no reconoce alguna columna, ajústalo manualmente en esa pantalla.
5. Clic en **Import**. Se crean las 13 historias de usuario (HU1–HU13) como **Product
   Backlog Item**, con su prioridad como *tag* (`Prioridad-Alta` / `Media`) y la
   descripción completa en formato "Como / Quiero / Para".

## Después de importar

- Ve a **Backlogs** para verlas priorizadas en el Product Backlog.
- Arrástralas desde ahí hacia **Sprint 1** para planificarlas (esto es lo que hace que
  aparezcan en el Taskboard que mostraste — actualmente vacío porque no hay work items
  asignados al sprint todavía).
- Dentro de cada Historia de Usuario puedes agregar **Tasks** hijas (por ejemplo, para
  HU2: "Diseñar formulario de citas", "Validar disponibilidad del médico", etc.) si
  quieres desglosar el trabajo técnico.

## Nota sobre el tipo de work item

El CSV usa `Product Backlog Item` porque tu proyecto usa el proceso **Scrum** de Azure
DevOps (se ve por la navegación "Backlogs / Sprints / Taskboard" en tu captura). Si tu
proyecto en realidad usa el proceso **Agile**, cambia `Product Backlog Item` por
`User Story` en el CSV antes de importar (Buscar y reemplazar en un editor de texto).
