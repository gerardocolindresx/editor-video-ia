# Prompt de edición

Úsalo **con cada video**. Requisito: que exista `Referentes/guia-de-estilo.md` (si no, usa antes [`estilo.md`](estilo.md)).

Copia el bloque, rellena la ficha y pégalo en Claude Code con esta carpeta abierta.

```
FICHA DEL VIDEO
- Archivo en Material crudo/: (nombre, o "el más reciente")
- Tema y para quién es:
- Objetivo: (educar / vender / entretener / marca personal)
- Duración máxima en segundos:
- Cierre o llamada a la acción:
- Cambios solo para este video: (ej. "sin música", "subtítulos más grandes")
- Efectos que quiero: (ej. texto detrás de mí, contador, tarjetas; o "elige tú")
- Lo que no quiero:

TAREA
Edita este video siguiendo mi guía de estilo y las reglas de CLAUDE.md.

1. Lee Referentes/guia-de-estilo.md y el perfil de mi marca en brands/.
2. Analiza el video: transcripción por palabra, tomas repetidas, pausas,
   encuadre y posición de mi cara.
3. Si te falta algo, pregúntame antes de producir: como máximo 4 preguntas,
   cada una con opciones y tu recomendación marcada.
4. Propón el plan de corte (qué se queda, qué se va y con qué frase empieza)
   y espera mi aprobación.
5. Guarda en Resultados/ un plan por escenas (tiempo, qué se dice, qué se ve,
   qué efecto y con qué herramienta) y enséñame el storyboard antes del render.
6. Produce en este orden: IT Reelsmaker (corte, 1080×1920, subtítulos) →
   Embedded Captions (solo si un efecto necesita recortarme del fondo) →
   Remotion / HyperFrames (animaciones) → Media Use (efectos, música y mezcla).
7. Exporta a Resultados/<nombre>_editado_v1.mp4. Cada corrección es una
   versión nueva (v2, v3…); nunca sobrescribas.

CONTROL DE CALIDAD ANTES DE ENTREGAR
- El gancho se entiende en 2 segundos incluso sin sonido.
- Los subtítulos van al tiempo de la voz, sin faltas y legibles en el móvil.
- Ningún texto ni gráfico tapa mi cara.
- Cada animación tiene un motivo y su efecto de sonido.
- La voz queda por encima de la música y el volumen final en −14 LUFS.
- Duración, resolución y audio comprobados en el archivo exportado.

ENTREGA
El video, el plan por escenas y un resumen corto: qué pasa en cada momento,
con qué herramienta se hizo y qué es fácil de ajustar.

Si te digo "siempre" o "nunca" en una corrección, guárdala como regla de mi
marca para los próximos videos.
```

## Corregir

Habla como a un editor: qué, dónde y en qué segundo.

- "Corta la pausa del segundo 12."
- "Los subtítulos más arriba, me tapan la mano."
- "Baja la música, no se me entiende."
- "Siempre pon el gancho en mayúsculas." (esto se guarda como regla)
