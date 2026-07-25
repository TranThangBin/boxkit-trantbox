#!/bin/sh

ln -sfT /usr/bin/dash /usr/bin/sh
./distrobox-shims.sh

grep -v "^#" ./trantbox.packages | xargs pacman -Syyu --needed --noconfirm

yes | pacman -Scc
rm -rf /tmp/* /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf
