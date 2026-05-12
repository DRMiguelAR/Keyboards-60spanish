#!/bin/bash
# Descarga la carpeta spdvk25 del repositorio a ~/Downloads/spdvk25

REPO_URL="https://github.com/DRMiguelAR/Keyboards-60spanish"
CARPETA="spdvk25"
DESTINO="$HOME/Downloads/$CARPETA"

echo "Descargando $CARPETA en $DESTINO ..."

if [ -d "$DESTINO" ]; then
    echo "La carpeta destino ya existe. Actualizando..."
    rm -rf "$DESTINO"
fi

# Clonar solo la subcarpeta usando sparse-checkout
git clone --filter=blob:none --sparse "$REPO_URL" "$DESTINO"
cd "$DESTINO"
git sparse-checkout set "$CARPETA"

# Mover contenido de la subcarpeta al destino raíz
mv "$CARPETA"/* . 2>/dev/null
mv "$CARPETA"/.[!.]* . 2>/dev/null
rm -rf "$CARPETA" .git

echo "Descarga completada en: $DESTINO"
ls "$DESTINO"
