#!/bin/bash

set -e

APP_NAME="CobblemonBrasil"
APP_ID="cobblemonbrasil"

INSTALL_DIR="$HOME/.local/share/$APP_NAME"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_ID.desktop"

echo "Removendo $APP_NAME..."

if [ -d "$INSTALL_DIR" ]; then
rm -rf "$INSTALL_DIR"
echo "Diretório removido."
fi

if [ -f "$DESKTOP_FILE" ]; then
rm -f "$DESKTOP_FILE"
echo "Atalho removido."
fi

echo "Desinstalação concluída."
