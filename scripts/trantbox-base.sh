#!/bin/false

./distrobox-shims.sh

pacman -Syu --needed --noconfirm
pacman -S \
  yay \
  bash-completion \
  bc \
  curl \
  diffutils \
  findutils \
  glibc \
  gnupg \
  iputils \
  inetutils \
  keyutils \
  less \
  lsof \
  man-db \
  man-pages \
  mlocate \
  mtr \
  ncurses \
  nss-mdns \
  openssh \
  pigz \
  pinentry \
  procps-ng \
  rsync \
  shadow \
  sudo \
  tcpdump \
  time \
  traceroute \
  tree \
  tzdata \
  unzip \
  util-linux \
  util-linux-libs \
  vte-common \
  wget \
  words \
  xorg-xauth \
  zip \
  mesa \
  vulkan-intel \
  vulkan-radeon \
  --needed --noconfirm

yes | pacman -Scc
rm -rf /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf

userrun() {
  if ! id build >/dev/null 2>&1; then
    useradd -m --shell=/bin/bash build
    usermod -L build
    echo "build ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
    echo "root ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
  fi
  su --pty -m -s /bin/sh -c "$*" build
}

cleanup() {
  if id build >/dev/null 2>&1; then
    userdel -r build
    rm -drf /home/build
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
    sed -i '/root ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
  fi
  rm -rf /tmp/* /var/cache/pacman/pkg/*
}
