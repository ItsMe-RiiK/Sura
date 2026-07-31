#!/bin/bash
set -e
echo "Installing Sura..."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if we are installing from a release package (files are alongside the script)
if [ -f "$SCRIPT_DIR/Sura" ] && [ -f "$SCRIPT_DIR/update.sh" ] && [ -f "$SCRIPT_DIR/icon.png" ]; then
    SURA_BIN="$SCRIPT_DIR/Sura"
    UPDATER_SCRIPT="$SCRIPT_DIR/update.sh"
    ICON_FILE="$SCRIPT_DIR/icon.png"
# Check if we are installing from source (assuming typical directory structure)
elif [ -f "$SCRIPT_DIR/../build/Sura" ] && [ -f "$SCRIPT_DIR/update.sh" ] && [ -f "$SCRIPT_DIR/../resources/images/icon.png" ]; then
    SURA_BIN="$SCRIPT_DIR/../build/Sura"
    UPDATER_SCRIPT="$SCRIPT_DIR/update.sh"
    ICON_FILE="$SCRIPT_DIR/../resources/images/icon.png"
else
    echo "Error: Cannot find required files for installation."
    echo "If you are installing from source, ensure you have compiled Sura first (e.g., cmake -B build && cmake --build build)"
    exit 1
fi

# Create standard user directories if they don't exist
mkdir -p ~/.local/bin ~/.local/share/applications ~/.local/share/icons/hicolor/256x256/apps

# Copy binary, updater, and icon
cp "$SURA_BIN" ~/.local/bin/sura
cp "$UPDATER_SCRIPT" ~/.local/bin/sura-update
chmod +x ~/.local/bin/sura-update
cp "$ICON_FILE" ~/.local/share/icons/hicolor/256x256/apps/sura.png

# Generate the desktop file dynamically
cat <<EOF > ~/.local/share/applications/sura.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Sura
Comment=A lightweight, Qt6 based image viewer
Exec=$HOME/.local/bin/sura %F
Icon=$HOME/.local/share/icons/hicolor/256x256/apps/sura.png
Terminal=false
Categories=Image;Viewer;Graphics;
EOF

# Refresh the desktop database
update-desktop-database ~/.local/share/applications 2>/dev/null || true

echo "Installation complete! Sura is now available in your application launcher."
