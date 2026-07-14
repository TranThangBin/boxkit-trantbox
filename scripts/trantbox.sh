#!/bin/sh

./distrobox-shims.sh

grep -v "^#" ./trantbox.packages | xargs pacman -Syyu --needed --noconfirm

wget https://raw.githubusercontent.com/Shringe/LatencyFleX-Installer/main/install.sh -O /usr/bin/latencyflex
sed -i 's@"dxvk.conf"@"/usr/share/latencyflex/dxvk.conf"@g' /usr/bin/latencyflex
chmod +x /usr/bin/latencyflex

LATENCYFLEX_VERSION=v0.1.1
LATENCYFLEX_OUT="latencyflex-$LATENCYFLEX_VERSION"
wget "https://github.com/ishitatsuyuki/LatencyFleX/releases/download/$LATENCYFLEX_VERSION/$LATENCYFLEX_OUT.tar.xz"
tar -xf "$LATENCYFLEX_OUT.tar.xz"
cp "$LATENCYFLEX_OUT/layer/usr/lib/x86_64-linux-gnu"/* \
  /usr/lib/
cp "$LATENCYFLEX_OUT/layer/usr/share/vulkan/implicit_layer.d"/* \
  /usr/share/vulkan/implicit_layer.d/
sed -i 's@"/usr/lib/x86_64-linux-gnu/liblatencyflex_layer.so"@"/usr/lib/liblatencyflex_layer.so"@g' \
  /usr/share/vulkan/implicit_layer.d/latencyflex.json
rm -rf "/latencyflex.tar.xz" "/latencyflex/"

yes | pacman -Scc
rm -rf /tmp/* /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf

ln -sfT /usr/bin/dash /usr/bin/sh
