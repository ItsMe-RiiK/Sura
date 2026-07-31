#!/bin/bash
set -e
echo "Installing Sura..."

# Create standard user directories if they don't exist
mkdir -p ~/.local/bin ~/.local/share/applications ~/.local/share/icons/hicolor/256x256/apps

# Copy binary, updater, and icon
cp Sura ~/.local/bin/sura
cp update.sh ~/.local/bin/sura-update
chmod +x ~/.local/bin/sura-update
cp icon.png ~/.local/share/icons/hicolor/256x256/apps/sura.png

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

# Cleanup the installation image
rm -f icon.png

echo "Installation complete! Sura is now available in your application launcher."
