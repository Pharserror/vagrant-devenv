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
    openbox openrc openssh openssl tigervnc x11vnc xorg-server xvfb libxinerama \
    busybox-extras \
    nodejs npm cargo unzip

# Alpine enable SSH
sudo rc-update add sshd

# Alpine add Docker service
sudo addgroup ${USER} docker
sudo rc-update add docker default
sudo service docker start

# Add X Config to start DWM
echo "exec dwm" > /home/vagrant/.xinitrc && chmod +x /home/vagrant/.xinitrc

# Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Install fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip
unzip IosevkaTerm.zip -d IosevkaTerm >> /dev/null
mkdir /home/vagrant/.fonts
mv IosevkaTerm/IosevkaTermNerdFontMono-Regular.ttf /home/vagrant/.fonts