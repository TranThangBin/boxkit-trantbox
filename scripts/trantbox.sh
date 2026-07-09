#!/bin/sh

./distrobox-shims.sh

grep -v "^#" ./trantbox.packages | xargs pacman -Syyu --needed --noconfirm

wget https://raw.githubusercontent.com/Shringe/LatencyFleX-Installer/main/install.sh -O /usr/bin/latencyflex
sed -i 's@"dxvk.conf"@"/usr/share/latencyflex/dxvk.conf"@g' /usr/bin/latencyflex
chmod +x /usr/bin/latencyflex

yes | pacman -Scc
rm -rf /tmp/* /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf
