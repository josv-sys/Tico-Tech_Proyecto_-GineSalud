# Proyecto Final — Análisis de Sistemas I
**Sistema de Información para GineSalud (empresa consultora: Tico Tech)**
Prof. Ing. José Javier Mata Guerrero — Universidad Politécnica Internacional
Integrantes: Melanny Fiorella Víquez Saborío, Josue Villarreal Saavedra

---

## 1. Objetivo general del proyecto

Diseñar y planificar (análisis de sistemas, no implementación completa) una solución
tecnológica para la clínica ginecológica **GineSalud**, que permita:

- Centralizar la gestión de pacientes, citas y expedientes clínicos.
- Definir una base de datos relacional desde cero.
- Dejar la solución preparada para integrarse con **Tableau** (reportes/dashboards).
- Aplicar la metodología ágil **SCRUM** durante toda la planificación.

## 2. Entregables finales (Semana 6)

Al cierre del curso se deben entregar **3 productos**:

1. **Documento técnico completo** (PDF con portada, índice y numeración de páginas).
2. **Presentación oral** con cámara encendida — participan **todos los integrantes sin excepción**.
3. **Video resumen** del proyecto (máx. 5 minutos).

También habrá **defensa del proyecto** con preguntas del profesor.

## 3. Estado actual del documento

El documento (`Proyecto Analisis Sist I HASTA SEMANA 2.pdf`) ya tiene desarrollado:

- ✅ **Semana 1**: Definición del negocio, roles SCRUM, tablero SCRUM, Product Backlog,
  ceremonias SCRUM, 8 historias de usuario iniciales, presupuesto (600 h / ₡7,200,000),
  puntos de historia (Story Points), arquitectura cliente-servidor de 3 capas, diagrama de
  arquitectura y primer diagrama UML de casos de uso.
- ✅ **Semana 2**: Requisitos funcionales y no funcionales, 4 historias de usuario
  adicionales (HU9–HU12), roles y permisos, stack técnico (Django + PostgreSQL +
  HTML/CSS/JS/Bootstrap + Tableau + Git/GitHub), decisión de usar Jira como tablero SCRUM.
- ⬜ **Semana 3, 4 y 5**: Están como encabezados vacíos en el documento — **pendientes**.

---

## 4. Qué falta hacer — resumen por semana

### 🟦 Semana 2 — Planificación y Documentación de Requisitos *(ya completada)*

Confirmar que el documento actual realmente cubre todo lo pedido por el profesor:

- [x] Refinamiento de requisitos funcionales y no funcionales.
- [x] Historias de usuario adicionales (HU9–HU12).
- [ ] **Diagrama de casos de uso mejorado** — el diagrama actual (Figura 2) es el de la
  Semana 1; falta una versión **actualizada** que incluya las HU9–HU12 (buscar pacientes,
  consultar agenda, controlar permisos, ver indicadores).
- [x] Definición de roles y permisos.
- [x] Requerimientos técnicos (Django, PostgreSQL, Bootstrap, Tableau, Git/GitHub).
- [x] Elección de tablero SCRUM (Jira) — pero falta **mostrar el tablero actualizado**
  (capturas o tabla con las tareas reales de Semana 2, no solo la justificación de usar Jira).

**Entrega pedida por el profesor:** documento con requisitos detallados + tableros
actualizados. → Falta el diagrama de casos de uso actualizado y evidencia visual del
tablero Jira/Trello.

---

### 🟨 Semana 3 — Modelado del Sistema y Análisis de Factibilidad *(pendiente)*

Hay que agregar al documento:

1. **Diagramas UML adicionales:**
   - Diagrama de **actividad** (ej. flujo de "programar cita" o "registrar diagnóstico").
   - Diagrama de **clases** (entidades: Paciente, Cita, Expediente, Médico, Usuario, Rol, etc.
     con atributos y relaciones — es la base para el modelo de base de datos).
   - Diagrama de **despliegue** (cómo se distribuyen físicamente los componentes: servidor
     web Django, base de datos PostgreSQL, cliente navegador, servidor/servicio Tableau).
2. **Refinamiento de la arquitectura**: justificar por qué cliente-servidor de 3 capas
   (ya definida en Semana 1) sigue siendo la mejor opción frente a monolítico o
   microservicios, o ajustarla si aplica.
3. **Análisis de factibilidad técnica y económica**: ¿el equipo tiene las capacidades
   técnicas (Django, PostgreSQL, Tableau)? ¿es viable económicamente con el presupuesto
   de ₡7,200,000 / 600 horas ya definido?
4. **Herramientas y tecnologías concretas**: ya están definidas en Semana 2 (Django,
   PostgreSQL, Bootstrap, Tableau, Git/GitHub) — en Semana 3 se debe **detallar
   versiones, entorno de desarrollo, hosting/servidor** planeado.
5. **Revisión y ajuste del presupuesto** con base en lo anterior.

**Entrega:** análisis de factibilidad + presupuesto ajustado.

---

### 🟧 Semana 4 — Planificación Avanzada y Gestión de Riesgos *(pendiente)*

Hay que agregar al documento:

1. **Ruta crítica del proyecto** (Critical Path Method): identificar las tareas que no
   pueden retrasarse sin atrasar todo el proyecto (ideal usar un diagrama de red o Gantt).
2. **Estimación más precisa de tiempos y recursos**, refinando las 600 horas y los Story
   Points ya calculados (47 puntos totales) — por ejemplo, desglosar por sprint.
3. **Análisis de riesgos**, con al menos:
   - Identificación de riesgos (técnicos, de negocio, de datos sensibles/salud, de plazos).
   - Probabilidad e impacto de cada uno.
   - Estrategias de mitigación.
   - Planes de contingencia.
   *(Ejemplos relevantes para GineSalud: fuga de datos clínicos sensibles, indisponibilidad
   del sistema durante horario de atención, retrasos en integración con Tableau.)*
4. **Métricas clave (KPIs) de éxito del sistema**, por ejemplo:
   - Tiempo promedio de registro de una cita.
   - % de citas gestionadas sin errores/conflictos de horario.
   - Tiempo de respuesta del sistema en consultas de expediente.
   - Adopción del sistema por parte del personal (uso real vs. capacitado).

**Entrega:** documento con planificación detallada, análisis de riesgos y métricas clave.

---

## 5. Resumen ejecutivo (lo esencial)

| Semana | Falta hacer |
|---|---|
| **2** | Actualizar el diagrama de casos de uso con HU9–HU12 y mostrar evidencia del tablero Jira actualizado. |
| **3** | Diagramas de actividad, clases y despliegue; análisis de factibilidad técnica/económica; ajuste de presupuesto. |
| **4** | Ruta crítica, estimaciones más finas, análisis de riesgos (identificación + mitigación + contingencia), definición de métricas/KPIs de éxito. |

> Nota: las Semanas 5 (prototipo funcional + pruebas) y 6 (entrega final, presentación oral,
> video, defensa) siguen pendientes más adelante según el cronograma del profesor.
