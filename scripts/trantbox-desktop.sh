#!/bin/sh

. ./trantbox-base.sh
grep -v '^#' ./trantbox-desktop.packages | su --pty -m -s /bin/sh -c "xargs yay -S --needed --noconfirm" build
