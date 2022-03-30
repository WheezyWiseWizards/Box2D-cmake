#! /bin/bash

set -eu
cmake -B build-switch -S . -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchains/DevkitA64Libnx.cmake
cd build-switch
make
cd ..

sudo cp build-switch/libBox2D-cmake.a $DEVKITPRO/portlibs/switch/lib/libBox2D.a
sudo mkdir -p $DEVKITPRO/portlibs/switch/include/Box2D/
sudo cp -r Box2D/Box2D/* $DEVKITPRO/portlibs/switch/include/Box2D/