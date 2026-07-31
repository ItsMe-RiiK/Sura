#!/bin/bash
set -e

echo "Compiling Sura..."
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

echo "Packaging release..."
RELEASE_DIR="Sura"
rm -rf $RELEASE_DIR
mkdir -p $RELEASE_DIR

# Copy binary
cp build/Sura $RELEASE_DIR/
# Copy icon
cp resources/images/icon.png $RELEASE_DIR/
# Copy scripts
cp scripts/install.sh $RELEASE_DIR/
cp scripts/uninstall.sh $RELEASE_DIR/
cp scripts/update.sh $RELEASE_DIR/

chmod +x $RELEASE_DIR/install.sh $RELEASE_DIR/uninstall.sh $RELEASE_DIR/update.sh

# Zip it up
zip -r Sura-release.zip $RELEASE_DIR/

echo "Release package built: Sura-release.zip"
