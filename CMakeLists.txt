cmake_minimum_required(VERSION 3.16)
project(Sura VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Gui Widgets REQUIRED)
find_package(exiv2 REQUIRED)

add_executable(Sura
    src/main.cpp
    src/Sura.cpp
    src/Sura.h
    src/Cli.cpp
    src/Cli.h
    src/Theme.cpp
    src/Theme.h
    src/CropBoxItem.cpp
    src/CropBoxItem.h
    resources/resources.qrc
)

target_link_libraries(Sura PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    exiv2lib
)
