# Sura

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-brightgreen.svg)

Sura is a sleek, modern, and lightweight image viewer built for Linux (supporting both X11 and Wayland) using Qt 6. It features EXIF data inspection, smart-edge cropping, and a minimalist interface.

## Download and Install (Pre-compiled)

1. Go to the [Releases](https://github.com/ItsMe-RiiK/sura/releases) page.
2. Download the latest `Sura-release.zip`.
3. Extract the ZIP file:
   ```bash
   unzip Sura-release.zip
   cd Sura
   ```
4. Run the installer script to install Sura to your desktop environment:
   ```bash
   ./install.sh
   ```
5. You can now launch Sura from your application menu or by typing `sura` in your terminal!

*(To uninstall, simply run `./uninstall.sh`)*

## Updating Sura

Sura comes with a built-in automated updater that fetches the latest release from GitHub. Whenever you want to upgrade, just open your terminal and run:
```bash
sura-update
```

## Compile from Source

If you prefer to build from source, follow these steps:

1. **Install Dependencies**
   Make sure you have a C++ compiler, CMake, Qt 6, and Exiv2 installed.
   ```bash
   sudo pacman -S base-devel cmake qt6-base exiv2
   ```

2. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/sura.git
   cd sura
   ```

3. **Build**
   ```bash
   cmake -B build -DCMAKE_BUILD_TYPE=Release
   cmake --build build
   ```

4. **Run**
   ```bash
   ./build/Sura
   ```


## LICENSE
This projects under MIT License, see [License](License)