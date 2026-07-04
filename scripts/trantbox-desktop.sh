#!/bin/sh

set -eu

. ./trantbox-base.sh

trap cleanup EXIT TERM INT

grep -v '^#' ./trantbox-desktop.packages | userrun yay -S --needed --noconfirm
