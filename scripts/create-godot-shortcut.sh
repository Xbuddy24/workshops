#!/usr/bin/env bash
set -euo pipefail

ICON_PNG_URL="https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/icon.png"
ICON_SVG_URL="https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/icon.svg"

find_godot_exec() {
  if [[ $# -gt 0 && -n "${1:-}" ]]; then
    echo "$1"
    return 0
  fi

  if command -v godot >/dev/null 2>&1; then
    command -v godot
    return 0
  fi

  local candidates=(
    "/usr/local/bin/godot"
    "$HOME/.local/bin/godot"
    "$HOME/godot"
  )

  for candidate in "${candidates[@]}"; do
    if [[ -x "$candidate" ]]; then
      echo "$candidate"
      return 0
    fi
  done

  return 1
}

GODOT_EXEC="${1:-}"
if ! GODOT_EXEC="$(find_godot_exec "$GODOT_EXEC")"; then
  echo "Could not find Godot executable."
  echo "Usage: $0 /path/to/godot"
  exit 1
fi

if [[ ! -x "$GODOT_EXEC" ]]; then
  echo "Godot executable is not executable: $GODOT_EXEC"
  exit 1
fi

ESCAPED_GODOT_EXEC="${GODOT_EXEC//\\/\\\\}"
ESCAPED_GODOT_EXEC="${ESCAPED_GODOT_EXEC// /\\ }"

if command -v xdg-user-dir >/dev/null 2>&1; then
  DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || true)"
else
  DESKTOP_DIR=""
fi

if [[ -z "$DESKTOP_DIR" || "$DESKTOP_DIR" == "$HOME" ]]; then
  DESKTOP_DIR="$HOME/Desktop"
fi

APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"
ICON_PATH="$ICON_DIR/godot.png"
DESKTOP_FILE="$APP_DIR/godot.desktop"
DESKTOP_SHORTCUT="$DESKTOP_DIR/Godot.desktop"

mkdir -p "$APP_DIR" "$ICON_DIR"

if command -v curl >/dev/null 2>&1; then
  if ! curl -fsSL "$ICON_PNG_URL" -o "$ICON_PATH"; then
    curl -fsSL "$ICON_SVG_URL" -o "${ICON_PATH%.png}.svg"
  fi
elif command -v wget >/dev/null 2>&1; then
  if ! wget -qO "$ICON_PATH" "$ICON_PNG_URL"; then
    wget -qO "${ICON_PATH%.png}.svg" "$ICON_SVG_URL"
  fi
else
  echo "Need curl or wget to download the icon."
  exit 1
fi

if [[ -f "$ICON_PATH" ]]; then
  ICON_REF="$ICON_PATH"
else
  ICON_REF="${ICON_PATH%.png}.svg"
fi

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Godot
Comment=Godot Game Engine
Exec=$ESCAPED_GODOT_EXEC %U
Icon=$ICON_REF
Terminal=false
Categories=Development;IDE;GameDevelopment;
StartupNotify=true
EOF

chmod +x "$DESKTOP_FILE"

if [[ -d "$DESKTOP_DIR" ]]; then
  cp "$DESKTOP_FILE" "$DESKTOP_SHORTCUT"
  chmod +x "$DESKTOP_SHORTCUT"

  if command -v gio >/dev/null 2>&1; then
    gio set "$DESKTOP_SHORTCUT" metadata::trusted true >/dev/null 2>&1 || true
  fi
fi

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$APP_DIR" >/dev/null 2>&1 || true
fi

echo "Created launcher: $DESKTOP_FILE"
if [[ -d "$DESKTOP_DIR" ]]; then
  echo "Created desktop shortcut: $DESKTOP_SHORTCUT"
fi
echo "Using executable: $GODOT_EXEC"
