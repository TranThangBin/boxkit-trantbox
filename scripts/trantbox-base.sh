#!/bin/sh

./distrobox-shims.sh

grep -v "^#" ./trantbox-base.packages | xargs pacman -Syyu --needed --noconfirm

yes | pacman -Scc
rm -rf /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf
