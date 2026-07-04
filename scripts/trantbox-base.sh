#!/bin/false

./distrobox-shims.sh

pacman -Syu --needed --noconfirm
pacman -S \
  bash-completion \
  bc \
  curl \
  diffutils \
  findutils \
  fish \
  glibc \
  gnupg \
  inetutils \
  iputils \
  keyutils \
  less \
  lsof \
  man-db \
  man-pages \
  mesa \
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
  vulkan-intel \
  vulkan-radeon \
  wget \
  words \
  xorg-xauth \
  yay \
  zip \
  --needed --noconfirm

yes | pacman -Scc
rm -rf /var/cache/pacman/pkg/*
sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf

useradd -m --shell=/bin/bash build
usermod -L build
echo "build ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
echo "root ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

_cleanup() {
  userdel -r build
  rm -drf /home/build
  sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
  sed -i '/root ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
  rm -rf /tmp/* /var/cache/pacman/pkg/*
}

trap _cleanup EXIT INT TERM
