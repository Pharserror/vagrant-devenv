#!/usr/bin/env bash

# Install dependencies/required packages
sudo apk update
sudo apk add --no-cache \
    bash curl docker docker-cli-compose fish python3 tar ripgrep ruby wget \
    alpine-sdk build-base libffi-dev openssl-dev bzip2-dev zlib-dev xz-dev \
    readline-dev sqlite-dev tk-dev perl gpg gawk linux-headers util-linux \
    gcc gnupg gpg dirmngr procps musl-dev zlib libssl1.1 \
    git neovim tmux \
    openbox openrc openssh openssl tigervnc x11vnc xorg-server xvfb libxinerama \
    busybox-extras \
    nodejs npm cargo unzip

# Alpine enable SSH
sudo rc-update add sshd

# Alpine add Docker service
sudo addgroup ${USER} docker
sudo rc-update add docker default
sudo service docker start