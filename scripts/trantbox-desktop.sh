#!/bin/sh

grep -v '^#' ./trantbox-desktop.packages | xargs yay -Syu --needed --noconfirm
