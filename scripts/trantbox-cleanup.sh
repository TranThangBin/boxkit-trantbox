userdel -r build
rm -drf /home/build
sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
sed -i '/root ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers
rm -rf /tmp/* /var/cache/pacman/pkg/*
