#!/usr/bin/env bash
# Prepara el editor en esta carpeta: comprueba requisitos, instala las librerías
# de Python y Node, descarga el modelo de caras y escribe it-reelsmaker.json
# con las rutas de este ordenador. Se puede ejecutar más de una vez.
set -euo pipefail

cd "$(dirname "$0")"
ROOT="$(pwd)"

ok()   { printf '  \033[32m✓\033[0m %s\n' "$1"; }
fail() { printf '  \033[31m✗\033[0m %s\n' "$1"; exit 1; }

# onnxruntime (rembg) solo publica versiones para Python 3.9–3.13: se elige la
# primera de esa franja que haya en el sistema.
pick_python() {
  for c in python3.13 python3.12 python3.11 python3.10 python3 /usr/bin/python3; do
    command -v "$c" >/dev/null 2>&1 || continue
    "$c" -c 'import sys; sys.exit(not ((3, 9) <= sys.version_info[:2] <= (3, 13)))' && { echo "$c"; return; }
  done
}

echo "1/5 Requisitos"
command -v ffmpeg  >/dev/null || fail "Falta ffmpeg: brew install ffmpeg"
command -v node    >/dev/null || fail "Falta Node.js 18+: brew install node"
PY="$(pick_python)"
[ -n "$PY" ] || fail "Falta Python entre 3.9 y 3.13: brew install python@3.13"
ok "ffmpeg, Node.js $(node -v) y $("$PY" --version) ($PY)"
command -v yt-dlp >/dev/null && ok "yt-dlp" || echo "  · yt-dlp no está (opcional, para descargar referentes): brew install yt-dlp"

echo "2/5 Librerías de Python (.venv)"
[ -d .venv ] || "$PY" -m venv .venv
.venv/bin/pip install -q --upgrade pip
.venv/bin/pip install -q -r requirements.txt
ok "faster-whisper, Pillow, OpenCV y rembg"

echo "3/5 Proyecto Remotion (reels/)"
(cd reels && npm install --silent)
ok "dependencias de Remotion"

echo "4/5 Modelo de detección de caras"
MODEL="models/face_detection_yunet_2023mar.onnx"
if [ ! -f "$MODEL" ]; then
  mkdir -p models
  curl -fsSL -o "$MODEL" "https://media.githubusercontent.com/media/opencv/opencv_zoo/main/models/face_detection_yunet/face_detection_yunet_2023mar.onnx"
fi
ok "YuNet en $MODEL"

echo "5/5 Configuración"
cat > it-reelsmaker.json <<EOF
{
  "project_root": "$ROOT",
  "remotion_dir": "$ROOT/reels",
  "assets_dir": "",
  "face_model": "$ROOT/$MODEL"
}
EOF
ok "it-reelsmaker.json con las rutas de esta carpeta"

cat <<'EOF'

Listo. Si aún no tienes los plugins de Claude Code, instálalos una vez:

  claude plugin marketplace add https://github.com/itpartypattaya/reels-montage.git
  claude plugin install it-reelsmaker@itparty

y el plugin hyperframes, más las skills de github.com/remotion-dev/skills
en ~/.claude/skills/. Después abre esta carpeta con Claude Code y usa
prompts/estilo.md.
EOF
