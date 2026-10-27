# Editor de video con IA

**Tu editor de Reels, TikTok y Shorts dentro de Claude Code.** Grabas, dejas el video en una carpeta y Claude corta silencios y tomas repetidas, pone subtítulos palabra por palabra, anima y mezcla el sonido. Con tu estilo y en tu computador.

Le enseñas tu estilo una vez con unos pocos videos de referencia. Desde ahí, cada video sale con tus colores, tu ritmo y tus subtítulos, y cada corrección que haces se convierte en una regla para el siguiente.

---

## Qué es esto

La mayoría de los editores con IA te dan un resultado genérico o te piden subir tus videos a la nube. Este hace otra cosa:

- **Corre en local.** La transcripción, los cortes, el render y la mezcla pasan en tu máquina. Tus videos no se suben a ningún servicio de edición.
- **Aprende tu estilo.** Analiza tus referentes y escribe una guía de estilo (paleta, tipografías, subtítulos, ritmo, sonido) que lee antes de cada edición.
- **Te pide permiso antes de lo irreversible.** Ves el plan de corte y el storyboard antes de renderizar.
- **Mejora con el uso.** Cuando dices *"siempre"* o *"nunca"*, la corrección se guarda como regla de tu marca.

No es una herramienta nueva: es una carpeta preparada que conecta cinco skills de código abierto para Claude Code, con dos prompts, unas reglas y un instalador.

---

## Empieza en cuatro pasos

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/gerardocolindresx/editor-video-ia.git
   ```
2. **Instala todo con un comando** (ver [requisitos](#instalación)):
   ```bash
   cd editor-video-ia && ./instalar.sh
   ```
3. **Enséñale tu estilo.** Deja 3–5 videos verticales en `Referentes/`, abre la carpeta en Claude Code y pega el prompt de [`prompts/estilo.md`](prompts/estilo.md).
4. **Edita.** Deja tu video crudo en `Material crudo/`, pega el prompt de [`prompts/editar.md`](prompts/editar.md), aprueba el plan y recoge el video en `Resultados/`.

---

## Las herramientas

Cinco skills de Claude Code y un programa de apoyo, cada una con un trabajo:

| # | Herramienta | Qué hace en tu video | Fuente | Licencia |
|---|---|---|---|---|
| 1 | **IT Reelsmaker** | La base: transcribe, corta silencios y tomas repetidas, arma el 1080×1920, subtítulos por palabra, audio a −14 LUFS | [itpartypattaya/reels-montage](https://github.com/itpartypattaya/reels-montage) | MIT |
| 2 | **Embedded Captions** | Te recorta del fondo: texto detrás de ti, fondo verde, recorte tipo papel, dolly zoom | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | Apache 2.0 |
| 3 | **Remotion** | Animaciones en código: subtítulos kinéticos, tarjetas, contadores, transiciones | [remotion-dev/skills](https://github.com/remotion-dev/skills) | [Licencia Remotion](https://github.com/remotion-dev/remotion/blob/main/LICENSE.md) |
| 4 | **HyperFrames** | Motion graphics en HTML: títulos, pantallas, producto | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | Apache 2.0 |
| 5 | **Media Use** | El sonido: efectos sincronizados, música de fondo y mezcla con tu voz por encima | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | Apache 2.0 |
| + | **yt-dlp** | Descarga tus referentes desde un link de YouTube, TikTok o Instagram | [yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp) | Unlicense |

> Remotion es gratis para personas, organizaciones sin ánimo de lucro y empresas de hasta 3 personas. Una empresa más grande (por ejemplo, una agencia) necesita su licencia de empresa.

---

## Cómo funciona

```
 UNA VEZ                         CADA VIDEO
┌──────────────────────┐      ┌────────────────────────────────────────────────────┐
│ Referentes/          │      │ Material crudo/                                    │
│        │             │      │        │                                           │
│        ▼             │      │        ▼                                           │
│ Guía de estilo ──────┼─────▶│ 1. Transcribe y detecta tomas repetidas            │
│ + perfil de marca    │      │ 2. Plan de corte .............. [ tú apruebas ]    │
└──────────────────────┘      │ 3. Corte, formato vertical, subtítulos (Reelsmaker)│
           ▲                  │ 4. Storyboard ................. [ tú apruebas ]    │
           │                  │ 5. Efectos: recorte, animaciones, motion graphics  │
           │                  │ 6. Sonido y mezcla a −14 LUFS (Media Use)          │
           │                  │        │                                           │
           │                  │        ▼                                           │
           │                  │ Resultados/<nombre>_editado_v1.mp4                 │
           │                  └────────┼───────────────────────────────────────────┘
           │                           │
           └──── "siempre" / "nunca" ──┘   cada corrección se guarda como regla
```

---

## Cómo lograr que cada video salga como tú quieres

La IA no adivina tu gusto: **lo acumula** en archivos que lee antes de editar. Cuanto mejor los alimentes al principio, menos corriges después.

| # | Haz esto | Por qué |
|---|---|---|
| 1 | **Elige referentes coherentes**, mejor tuyos o muy parecidos entre sí | Si mezclas estilos distintos, la IA saca un promedio que no se parece a ninguno |
| 2 | **Dale tu identidad visual** en la ficha del prompt de estilo: colores, tipografías, tono | Así el video se ve como tú, no como tus referentes |
| 3 | **No te saltes las dos aprobaciones**: plan de corte y storyboard | Corregir un plan cuesta segundos; corregir un render, minutos |
| 4 | **Di "siempre" o "nunca"** cuando una corrección deba repetirse | Se guarda en `brands/<tu-marca>/rules.md` y el siguiente video ya lo sabe |
| 5 | **Calibra con 3 a 5 videos** y guarda el que salga bien como preset de serie | Los primeros necesitan correcciones; después, el formato se repite solo |
| 6 | **Graba siempre igual**: misma luz, encuadre y distancia, en vertical | Un material constante da una edición constante |

En los primeros videos pide el modo `full`: hace más preguntas y explica por qué decide cada cosa.

---

## Qué hay dentro

```
editor-video-ia/
├── Material crudo/              tus videos sin editar (nunca se modifican)
├── Referentes/                  videos de referencia + guia-de-estilo.md
├── Resultados/                  plan por escenas y video final, por versiones (v1, v2…)
├── prompts/
│   ├── estilo.md                una vez: construye tu guía de estilo
│   └── editar.md                cada video: ficha + instrucciones de edición
├── brands/                      tu perfil de marca: colores, tono y reglas acumuladas
├── reels/                       proyecto Remotion con el kit de IT Reelsmaker
├── CLAUDE.md                    reglas que Claude lee en cada sesión
├── instalar.sh                  instala dependencias y escribe la configuración
├── it-reelsmaker.example.json   plantilla de configuración (instalar.sh crea la real)
└── requirements.txt             librerías de Python
```

Tus videos, tu perfil de marca, la configuración local y las dependencias están en `.gitignore`: nada personal acaba en el repositorio si lo bifurcas.

---

## Instalación

<details>
<summary><strong>1. Requisitos (macOS)</strong></summary>

- [Claude Code](https://code.claude.com) (app de escritorio o terminal) con un plan de pago de Claude
- [Homebrew](https://brew.sh), y después:
  ```bash
  brew install ffmpeg node yt-dlp
  ```
- Python entre 3.9 y 3.13 (macOS trae la 3.9; si tienes una más nueva, `instalar.sh` elige una compatible o te dice cuál instalar)

</details>

<details>
<summary><strong>2. Plugins y skills de Claude Code</strong></summary>

IT Reelsmaker:
```bash
claude plugin marketplace add https://github.com/itpartypattaya/reels-montage.git
```
```bash
claude plugin install it-reelsmaker@itparty
```

HyperFrames (incluye Embedded Captions y Media Use): instálalo desde [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes).

Remotion: copia las carpetas `skills/*` de [remotion-dev/skills](https://github.com/remotion-dev/skills) a `~/.claude/skills/`.

> Instala solo `it-reelsmaker`, no el complemento `it-reelsmaker-online`: ese envía material a servicios externos.

</details>

<details>
<summary><strong>3. El editor</strong></summary>

```bash
./instalar.sh
```

Comprueba los requisitos, crea el entorno de Python en `.venv/`, instala Remotion en `reels/`, descarga el modelo de detección de caras y escribe `it-reelsmaker.json` con las rutas de tu carpeta. Puedes ejecutarlo de nuevo si mueves la carpeta.

La primera transcripción descarga el modelo de Whisper (~1,5 GB) y el primer render descarga el navegador interno de Remotion.

</details>

<details>
<summary><strong>4. Música de fondo (opcional)</strong></summary>

Media Use saca la música del catálogo de HeyGen. Instala su CLI con las [instrucciones oficiales](https://developers.heygen.com/cli) e inicia sesión con OAuth, que usa los créditos gratis de tu suscripción (una API key cobra por uso):

```bash
heygen auth login --oauth
```

Sin HeyGen, los efectos de sonido siguen funcionando con la librería incluida.

</details>

---

## Preguntas frecuentes

**¿Necesito saber programar?**
No. Hablas con Claude en español y él ejecuta los programas. La terminal solo la usas para instalar.

**¿Mis videos se suben a algún sitio?**
No a un servicio de edición. Lo que sale de tu computador es lo que Claude ve para trabajar (la transcripción y algunos fotogramas, bajo los términos de tu cuenta de Anthropic), las descargas de programas y modelos y, si usas HeyGen, las búsquedas de música.

**¿Cuánto tarda?**
Transcribir lleva unos 2–3 minutos por cada 90 segundos de audio. El render es rápido: un video de prueba de 9 segundos tardó 30 segundos en un Mac con chip M4. Lo que más tiempo lleva es revisar y aprobar los planes, y es a propósito.

**¿Funciona en Windows o Linux?**
Las herramientas lo permiten, pero este repositorio solo se ha probado en macOS. `instalar.sh` debería funcionar en Linux; se agradecen pruebas.

**¿Puedo usar videos de otros creadores como referencia?**
Sí, para estudiar el estilo. El prompt extrae el lenguaje visual, no su contenido, sus frases ni sus marcas. No los vuelvas a publicar.

**¿Y si no me gusta el resultado?**
Pídelo como a un editor: qué, dónde y en qué segundo. *"Corta la pausa del segundo 12"*, *"baja la música, no se me entiende"*. Cada corrección crea una versión nueva sin borrar la anterior.

**¿Puedo usarlo con clientes?**
Sí, con una copia de la carpeta por cliente, para no mezclar perfiles de marca. Revisa la licencia de Remotion si trabajas como empresa de más de 3 personas.

---

## Contribuir

Issues y pull requests bienvenidos, sobre todo pruebas en Windows y Linux, mejoras a los prompts y nuevas reglas de calidad para `CLAUDE.md`.

---

Hecho por **Gerardo Colindres**, Growth Product Manager. [MIT](LICENSE): úsalo, cámbialo y llévalo a tus clientes. Las herramientas de terceros tienen sus propias licencias: ver [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
