#!/bin/bash
set -e
echo "Installing Sura..."

REPO="ItsMe-RiiK/Sura"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" 2>/dev/null && pwd || echo "" )"

# Create standard user directories if they don't exist
mkdir -p ~/.local/bin ~/.local/share/applications ~/.local/share/icons/hicolor/256x256/apps

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/../build/Sura" ]; then
    echo "Installing from local source build..."
    cp "$SCRIPT_DIR/../build/Sura" ~/.local/bin/sura
    cp "$SCRIPT_DIR/update.sh" ~/.local/bin/sura-update
    cp "$SCRIPT_DIR/../resources/images/icon.png" ~/.local/share/icons/hicolor/256x256/apps/sura.png
else
    echo "Fetching latest AppImage from GitHub..."
    LATEST_RELEASE_URL=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | grep "browser_download_url.*Sura-.*\.AppImage" | cut -d : -f 2,3 | tr -d \" | xargs)
    if [ -z "$LATEST_RELEASE_URL" ]; then
        echo "Error: Could not find the latest AppImage release."
        exit 1
    fi
    curl -L -o ~/.local/bin/sura "$LATEST_RELEASE_URL"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/scripts/update.sh" -o ~/.local/bin/sura-update
    curl -sL "https://raw.githubusercontent.com/$REPO/main/resources/images/icon.png" -o ~/.local/share/icons/hicolor/256x256/apps/sura.png
fi

chmod +x ~/.local/bin/sura
chmod +x ~/.local/bin/sura-update

# Set custom file icon for the binary using gio
gio set ~/.local/bin/sura metadata::custom-icon "file://$HOME/.local/share/icons/hicolor/256x256/apps/sura.png" 2>/dev/null || true

# Generate the desktop file dynamically
cat <<EOF > ~/.local/share/applications/sura.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Sura
Comment=A lightweight, Qt6 based image viewer
Exec=$HOME/.local/bin/sura %F
Icon=sura
Terminal=false
Categories=Image;Viewer;Graphics;
EOF

# Refresh the desktop database
update-desktop-database ~/.local/share/applications 2>/dev/null || true

echo "Installation complete! Sura is now available in your application launcher."
