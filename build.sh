#!/bin/bash

build_uboot() {
    make uboot-rebuild
}

build_linux() {
    make linux-rebuild
}

build_clean() {
    rm -rf output
    rm .config
    rm .config.old
}

build_all() {
    rm -rf output
    rm .config
    rm .config.old
    cp qemu_aarch64_virt_defconfig .config
    make -j10
}

if test "$1" = "uboot" ; then
    build_uboot
elif test "$1" = "linux" ; then
    build_linux
elif test "$1" = "clean" ; then
    build_clean
elif test "$1" = "all" ; then
    build_all
fi
