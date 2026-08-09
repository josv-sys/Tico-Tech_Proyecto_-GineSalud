# Importar el backlog a Azure Boards

No hay forma de conectarse a Azure DevOps automáticamente desde aquí (no hay plugin/API
disponible en este entorno), pero Azure Boards tiene un importador nativo de CSV que deja
el tablero poblado en menos de un minuto.

## Pasos (según la [documentación oficial](https://learn.microsoft.com/en-us/azure/devops/boards/queries/import-work-items-from-csv))

1. En tu proyecto de Azure DevOps, ve a **Boards** → **Queries**.
2. Clic en **Import work items** (botón/menú en la vista de Queries).
3. Selecciona el archivo [`ginesalud_backlog.csv`](./ginesalud_backlog.csv) de esta carpeta.
4. Verifica el mapeo de columnas (`Work Item Type`, `Title`, `Priority`, `Tags`,
   `Description`) y confirma.
5. Los 13 work items se cargan en estado **no guardado** (unsaved) en la vista de
   resultados. Revisa que no queden filas en rojo (errores) y clic en **Save items**.

## Si vuelve a fallar "Invalid work item type"

Ya probamos `Product Backlog Item` (Scrum) y `User Story` (Agile) y ambos fallaron, así
que el CSV ahora usa **`Issue`**, que es el tipo por defecto del proceso **Basic** (el
proceso que Azure DevOps usa automáticamente en organizaciones nuevas desde 2019). Si
`Issue` también falla, confírmalo de una vez por todas con cualquiera de estas dos formas:

- **La más rápida:** en tu proyecto, Boards → clic en **"+ New Work Item"** → el dropdown
  que se despliega lista los tipos válidos exactos de tu proyecto.
- **Alternativa:** **Project Settings** (abajo a la izquierda) → **Process** → te dice el
  nombre exacto del proceso (Agile / Scrum / Basic / CMMI / uno **Inherited**
  personalizado).

| Proceso | Tipo de work item a usar |
|---|---|
| Basic | `Issue` (ya está así) |
| Agile | `User Story` |
| Scrum | `Product Backlog Item` |
| CMMI | `Requirement` |
| Inherited/personalizado | El nombre que muestre el dropdown de "+ New Work Item" |

Para cambiarlo: abre `ginesalud_backlog.csv` en un editor de texto y reemplaza la palabra
`Issue` al inicio de cada una de las 13 líneas de datos (no toques la fila de encabezado).

## Por qué se quitó el campo `State`

La documentación de Microsoft indica explícitamente que **no se debe incluir la columna
`State`** al importar work items nuevos (los nuevos siempre entran como *New* por
defecto) — se removió esa columna del CSV porque podía ser la causa real del rechazo.

## Después de importar

- Ve a **Backlogs** para verlas priorizadas en el Product Backlog.
- Arrástralas desde ahí hacia **Sprint 1** para planificarlas (esto es lo que hace que
  aparezcan en el Taskboard que mostraste — actualmente vacío porque no hay work items
  asignados al sprint todavía).
- Dentro de cada Historia de Usuario puedes agregar **Tasks** hijas (por ejemplo, para
  HU2: "Diseñar formulario de citas", "Validar disponibilidad del médico", etc.) si
  quieres desglosar el trabajo técnico.
