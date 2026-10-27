# Editor de video con IA

Editor de videos cortos verticales (Reels, TikTok, Shorts). Todo corre en local, salvo los servicios que el usuario conecte (HeyGen para la música).

## Carpetas
| Carpeta | Qué va |
|---|---|
| `Material crudo/` | Videos crudos. **Nunca modificar ni borrar**: se trabaja sobre copias en `edit/<id>/`. |
| `Referentes/` | Videos de referencia y `guia-de-estilo.md`. **Nunca modificar ni borrar los videos.** |
| `Resultados/` | Solo entregables: plan por escenas y `<nombre>_editado_vN.mp4`. Nunca sobrescribir: versión nueva. |
| `prompts/` | `estilo.md` (una vez) y `editar.md` (cada video). |
| `edit/`, `brands/` | Trabajo interno de IT Reelsmaker: por video y perfiles de marca (con sus reglas). |
| `reels/` | Proyecto Remotion con el kit de IT Reelsmaker (no tocar a mano). |
| `models/` | Modelo de caras YuNet (lo descarga `instalar.sh`). |

## Herramientas
- Instalación: `./instalar.sh` (crea `.venv/`, instala `reels/`, escribe `it-reelsmaker.json` con las rutas de esta carpeta).
- Python: antes de los scripts, `source .venv/bin/activate` (sin activar, `rembg` no se encuentra). `huggingface_hub<1.0` está fijado a propósito: rembg 2.0.61 falla con la 1.x.
- Skills: IT Reelsmaker (plugin `it-reelsmaker@itparty`, solo la versión local), Remotion (`remotion-*`), HyperFrames + Embedded Captions + Media Use (plugin `hyperframes`), yt-dlp.
- Correcciones de transcripción (`cut.json → fix`): la clave incluye la puntuación pegada (`"Constantia.": "constancia."`).
- Media Use: música con la CLI de HeyGen (`heygen auth login --oauth`); los efectos de sonido funcionan también sin cuenta (`--local-only`). Confirmar antes de cualquier uso que gaste créditos de pago.

## Reglas
- Nunca tapar la cara con texto ni gráficos. Cero faltas de ortografía en pantalla.
- No inventar datos, cifras ni precios.
- Nada de servicios de pago, IA externa ni el add-on `it-reelsmaker-online` sin preguntar.
- Referentes de otros creadores: solo para estudiar el estilo, nunca para republicar.
- Plan de corte y storyboard aprobados antes de renderizar.
- Una corrección con "siempre" o "nunca" se guarda como regla de la marca (`brand.py rule`).
