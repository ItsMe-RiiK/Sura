# Sura

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-brightgreen.svg)

Sura is a sleek, modern, and lightweight image viewer built for Linux (supporting both X11 and Wayland) using Qt 6. It features EXIF data inspection, smart-edge cropping, and a minimalist interface.

## Download and Install (Pre-compiled)

Sura is distributed as a portable AppImage. You can install it directly from your terminal using our web installer script:

```bash
curl -sL https://raw.githubusercontent.com/ItsMe-RiiK/sura/main/scripts/install.sh | bash
```

This will automatically download the latest Sura AppImage, install it to your user directory, and set up the application launcher. You can now launch Sura from your application menu or by typing `sura` in your terminal!

*(To uninstall, simply open your terminal and run `sura-uninstall`)*

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
   sudo pacman -S base-devel cmake qt6-base qt6-wayland exiv2
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