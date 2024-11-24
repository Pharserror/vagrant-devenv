#!/usr/bin/env bash

# Setup directories
mkdir -p /home/vagrant/source

# Install dependencies/required packages
sudo apk update
sudo apk add --no-cache \
    bash curl docker docker-cli-compose fish python3 tar ripgrep ruby wget \
    alpine-sdk build-base libffi-dev openssl-dev bzip2-dev zlib-dev xz-dev \
    readline-dev sqlite-dev tk-dev perl gpg gawk linux-headers util-linux \
    gcc gnupg gpg dirmngr procps musl-dev zlib libssl1.1 \
    git neovim tmux \
    dwm st \
    openbox openrc openssh openssl tigervnc x11vnc xorg-server xvfb \
    busybox-extras \
    node cargo

# Alpine enable SSH
sudo rc-update add sshd

# Alpine add Docker service
sudo addgroup ${USER} docker
sudo rc-update add docker default
sudo service docker start

# Add X Config to start DWM
echo "exec dwm" > ~/.xinitrc && chmod +x ~/.xinitrc

# Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash