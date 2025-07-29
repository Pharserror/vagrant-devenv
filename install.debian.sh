#!/usr/bin/env bash

# Install dependencies/required packages
sudo apt-get update
# swap linux-headers-amd/arm64 for your architecture below
sudo apt-get install -y \
    bash curl fish python3 tar ripgrep ruby wget \
    build-essential libffi-dev libssl-dev libbz2-dev zlib1g-dev xz-utils \
    libreadline-dev libsqlite3-dev tk-dev perl gnupg2 gawk linux-headers-arm64 util-linux \
    gcc dirmngr procps musl-dev zlib1g \
    git emacs tmux \
    openbox openrc openssh-server openssl x11vnc xvfb \
    busybox \
    nodejs npm cargo unzip

# Enable SSH
sudo systemctl enable ssh
