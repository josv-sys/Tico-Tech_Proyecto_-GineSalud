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

El CSV usa `User Story` porque tu proyecto usa el proceso **Agile** de Azure DevOps (el
error "Invalid work item type Product Backlog Item" confirma que NO es Scrum — en Scrum
ese tipo sí existe, así que si diera ese error es porque tu proceso es otro).

Si al importar te vuelve a salir "Invalid work item type User Story", tu proyecto usa un
proceso distinto. Para confirmarlo: **Project Settings** (abajo a la izquierda) →
**Process** → verás el nombre exacto (Agile, Scrum, Basic o CMMI). Según cuál sea,
reemplaza `User Story` en el CSV por:

| Proceso | Tipo de work item a usar |
|---|---|
| Agile | `User Story` (ya está así) |
| Scrum | `Product Backlog Item` |
| Basic | `Issue` |
| CMMI | `Requirement` |

Para reemplazar: abre `ginesalud_backlog.csv` en un editor de texto y usa buscar y
reemplazar (la palabra aparece al inicio de cada una de las 13 líneas de datos).
