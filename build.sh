#!/bin/bash
echo "Init ENV" ;
export ANDROID_MAJOR_VERSION=q ;
export PLATFORM_VERSION=10 ;
export ARCH=arm64 ;
export SUBARCH=arm64 ;
export CC="clang" ;
export CROSS_COMPILE="aarch64-linux-gnu-" ;
echo "Clean Build ENV" ;
make clean && make mrproper;
echo "Building Kernel" ;
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y CROSS_COMPILE="aarch64-linux-gnu-" CC="clang" physwizz_defconfig ;
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y CROSS_COMPILE="aarch64-linux-gnu-" CC="clang" -j2 ;
