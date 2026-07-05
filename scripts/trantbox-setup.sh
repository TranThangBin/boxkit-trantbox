useradd -m --shell=/bin/bash build
usermod -L build
echo "build ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
echo "root ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
