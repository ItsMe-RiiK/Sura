#!/bin/bash
set -e

REPO="ItsMe-RiiK/Sura"
echo "Checking for updates from https://github.com/$REPO..."

# Fetch latest release info using GitHub API
LATEST_RELEASE_URL=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | grep "browser_download_url.*Sura-release.zip" | cut -d : -f 2,3 | tr -d \" | xargs)

if [ -z "$LATEST_RELEASE_URL" ]; then
    echo "Error: Could not find the latest release."
    echo "Please ensure you have an active internet connection and that a release with 'Sura-release.zip' is published on GitHub."
    exit 1
fi

echo "Found latest release! Downloading from:"
echo "$LATEST_RELEASE_URL"

cd /tmp
rm -f Sura-release.zip
rm -rf Sura/

# Download the ZIP file
curl -L -o Sura-release.zip "$LATEST_RELEASE_URL"

echo "Extracting update..."
unzip -q Sura-release.zip

echo "Applying update..."
cd Sura
chmod +x install.sh
./install.sh

echo "Cleaning up temporary files..."
cd /tmp
rm -rf Sura/ Sura-release.zip

echo "Sura has been successfully updated to the latest version!"
