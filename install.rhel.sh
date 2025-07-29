#!/usr/bin/env bash

# Install dependencies/required packages
sudo dnf check-update
sudo dnf update
# swap linux-headers-amd/arm64 for your architecture below
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y \
    bash curl fish python3 tar ripgrep ruby wget \
    libffi-devel openssl-devel bzip2-devel zlib-devel xz-devel \
    readline-devel sqlite-devel tk-devel perl gnupg2 gawk util-linux \
    gcc dirmngr procps musl-devel zlib \
    git tmux \
    openssh-server openssl  \
    xorg-x11-server-Xvfb xorg-x11-server-util xorg-x11-server-devel xorg-x11-server-common \
    nodejs npm cargo unzip

# Enable SSH
sudo systemctl enable ssh
