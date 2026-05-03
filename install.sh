#!/bin/bash

set -euo pipefail

APP_NAME="CobblemonBrasil"
APP_ID="cobblemonbrasil"
INSTALL_DIR="$HOME/.local/share/$APP_NAME"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_ID.desktop"
REPO="Somma11/CobblemonBrasil-linux"

LOG_FILE="/tmp/${APP_ID}_install.log"
TMP_FILE="/tmp/${APP_ID}.tar.gz"

exec > >(tee -a "$LOG_FILE") 2>&1

# ==============================

# Utils

# ==============================

log() { echo "[INFO] $1"; }
error() { echo "[ERROR] $1"; exit 1; }

has_cmd() { command -v "$1" >/dev/null 2>&1; }

# ==============================

# Detect OS

# ==============================

detect_os() {
if [ -f /etc/arch-release ]; then OS="arch"
elif [ -f /etc/debian_version ]; then OS="debian"
elif [ -f /etc/fedora-release ]; then OS="fedora"
else OS="unknown"
fi
log "OS detectado: $OS"
}

# ==============================

# Install dependencies

# ==============================

install_deps() {
local deps=(curl tar)

```
has_cmd zenity || deps+=(zenity)

# Electron runtime deps (mínimo funcional)
case "$OS" in
    arch) deps+=(libxcrypt-compat nss gtk3 libx11 libxcb) ;;
    debian) deps+=(libnss3 libgtk-3-0 libx11-6) ;;
    fedora) deps+=(nss gtk3 libX11) ;;
esac

local missing=()
for d in "${deps[@]}"; do
    has_cmd "$d" || missing+=("$d")
done

[ ${#missing[@]} -eq 0 ] && return

log "Instalando dependências: ${missing[*]}"

case "$OS" in
    arch) sudo pacman -Sy --needed "${missing[@]}" ;;
    debian) sudo apt update && sudo apt install -y "${missing[@]}" ;;
    fedora) sudo dnf install -y "${missing[@]}" ;;
    *) error "Instale manualmente: ${missing[*]}" ;;
esac
```

}

# ==============================

# UI helper

# ==============================

ui_msg() {
if has_cmd zenity; then
zenity --info --text="$1"
else
echo "$1"
fi
}

ui_confirm() {
if has_cmd zenity; then
zenity --question --text="$1"
return $?
else
read -p "$1 (y/n): " ans
[[ "$ans" == "y" ]]
fi
}

# ==============================

# Get latest release

# ==============================

get_release() {
log "Obtendo release mais recente..."
URL=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" 
| grep browser_download_url 
| grep linux.*tar.gz 
| cut -d '"' -f 4 | head -n 1)

```
[ -z "$URL" ] && error "Não foi possível obter URL da release"

log "Download URL: $URL"
```

}

# ==============================

# Download

# ==============================

download() {
log "Baixando..."
curl -L "$URL" -o "$TMP_FILE"
}

# ==============================

# Install app

# ==============================

install_app() {
if [ -d "$INSTALL_DIR" ]; then
ui_confirm "Já existe uma instalação. Reinstalar?" || exit 0
rm -rf "$INSTALL_DIR"
fi

```
mkdir -p "$INSTALL_DIR"

log "Extraindo..."
tar -xzf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

chmod -R +x "$INSTALL_DIR"
```

}

# ==============================

# Desktop entry

# ==============================

create_desktop() {
EXEC="$INSTALL_DIR/$APP_ID"

```
# fallback se nome diferente
[ -f "$EXEC" ] || EXEC=$(find "$INSTALL_DIR" -type f -executable | head -n 1)

cat > "$DESKTOP_FILE" <<EOF
```

[Desktop Entry]
Name=$APP_NAME
Exec=$EXEC
Icon=$INSTALL_DIR/icon.png
Type=Application
Categories=Game;
EOF

```
chmod +x "$DESKTOP_FILE"
```

}

# ==============================

# Cleanup

# ==============================

cleanup() {
rm -f "$TMP_FILE"
}

# ==============================

# MAIN

# ==============================

main() {
detect_os
install_deps
get_release
download
install_app
create_desktop
cleanup

```
ui_msg "$APP_NAME instalado com sucesso!"
```

}

main
