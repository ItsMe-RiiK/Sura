#!/bin/bash
echo "Uninstalling Sura..."

rm -f ~/.local/bin/sura
rm -f ~/.local/bin/sura-update
rm -f ~/.local/share/applications/sura.desktop
rm -f ~/.local/share/icons/hicolor/256x256/apps/sura.png

update-desktop-database ~/.local/share/applications 2>/dev/null || true

echo "Sura has been completely uninstalled."
