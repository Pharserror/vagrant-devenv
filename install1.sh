#!/usr/bin/env bash

# setup directories
mkdir -p /home/vagrant/dotfiles
# mkdir -p /home/vagrant/.emacs.d
mkdir -p /home/vagrant/downloads
# If you are going to rsync your code don't forget to remove the appropriate lines
# in the Vagrantfile
# mkdir -p /home/vagrant/source

# CentOS/Fedora/RedHat
# install base packages
# sudo yum update
# sudo yum groupinstall -y "Development Tools"
# sudo yum install -y git nodejs tmux curl tar gzip wget lua lua-devel luajit \
#                     luajit-devel ctags python python-devel python3 python3-devel \
#                     tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
#                     perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel ruby-devel
#
# Debian/Ubuntu
sudo apt-get update
sudo apt-get install -y git tmux curl tar wget perl gnupg2 fzf # \
#                       #
#                       # Use for when you want to build emacs
#                       # build-essential emacs python python3

# +--------------------------------+
# |== BUILDING EMACS FROM SOURCE ==|
# +--------------------------------+
# Use if you're building emacs from source - don't forget to remove emacs from above
# Emacs Packages for Debian 9 and lower, I believe
# sudo apt-get install y- gtk+3.0 libwebkit2gtk-3.0 webkitgtk+2 \
#                         webkitgtk+3.0 libwebkitgtk-dev libwebkitgtk-3.0-dev
#
# Emacs Packages for Debian 10 - Successful build with 26.3 on Aug. 4TH 2020
# sudo apt install -y autoconf automake libtool texinfo build-essential xorg-dev \
#                     libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev \
#                     libtiff-dev libm17n-dev libpng-dev librsvg2-dev libotf-dev \
#                     libgnutls28-dev libxml2-dev libwebkit2gtk-4.0-dev apt-transport-https \
#                     ca-certificates curl gnupg-agent software-properties-common

# build emacs - TODO: use env var for version
# cd /home/vagrant/downloads
# echo "Downloading emacs..."
# wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-26.3.tar.gz
# echo "Emacs downloaded"
# tar -xf emacs-26.3.tar.gz
# cd /home/vagrant/downloads/emacs-26.3/
# echo "Installing emacs dependencies..."
# sudo apt-get build-dep -y emacs26
# echo "Emacs deps installed"
# echo "Configuring emacs..."
# sudo ./configure --with-x-toolkit=gtk3 --with-mailutils --with-xwidgets
# echo "Emacs configured"
# echo "Making emacs..."
# sudo make bootstrap
# echo "Emacs made"
# echo "Installing emacs..."
# sudo make install
# echo "Emacs installed"

# EMACS DOCKER INSTALL
# Shouldn't need to do this if the Docker provider for ./emacs/Vagrantfile works
#
# wget https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/containerd.io_1.2.13-2_amd64.deb
# wget https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/docker-ce-cli_19.03.12~3-0~debian-buster_amd64.deb
# wget https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/docker-ce_19.03.12~3-0~debian-buster_amd64.deb
# sudo dpkg -i https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/containerd.io_1.2.13-2_amd64.deb
# sudo dpkg -i https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/docker-ce-cli_19.03.12~3-0~debian-buster_amd64.deb
# sudo dpkg -i https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/docker-ce_19.03.12~3-0~debian-buster_amd64.deb
# docker pull pharserror/emacs-27-native-comp:initial

# Grab dotfiles
git clone https://github.com/Pharserror/dotfiles.git /home/vagrant/dotfiles
sudo chown -R vagrant /home/vagrant/dotfiles
sh /home/vagrant/dotfiles/install.sh

# Install Spacemacs
# Use this if you don't want to use the emacs Docker container
#
# echo Cloning spacemacs...
# git clone https://github.com/syl20bnr/spacemacs /home/vagrant/.emacs.d
# echo Spacemacs cloned
# sudo chown -R vagrant /home/vagrant/.emacs.d
# mkdir /home/vagrant/.emacs.d/.cache
# sudo chown -R vagrant /home/vagrant/.emacs.d/.cache

# Install fzf
#
# git clone https://github.com/ashyisme/fzf-spacemacs-layer.git ~/.emacs.d/private/fzf

# Install yasnippets
#
# mkdir -p /home/vagrant/.emacs.d/private/snippets/js-mode
# mkdir -p /home/vagrant/.emacs.d/private/snippets/typescript-mode
# echo "js-mode" >> /home/vagrant/.emacs.d/private/snippets/typescript-mode/.yas-parents
# mkdir -p /home/vagrant/.emacs.d/private/snippets/js2-mode
# echo "js-mode" >> /home/vagrant/.emacs.d/private/snippets/js2-mode/.yas-parents
# echo "Installing Yasnippets for Emacs"
# sudo git clone https://github.com/Pharserror/js2-mode.git ~/.emacs.d/private/snippets/js-mode/
# echo "Snippets installed"
# +------------------------+
# |== END OF EMACS SETUP ==|
# +------------------------+

# Install Vim8
#
# echo Cloning vim 8...
# git clone https://github.com/vim/vim.git /home/vagrant/vim
# cd /home/vagrant/vim/
# echo Vim cloned
# echo Configuring vim...
# sudo ./configure
# echo VIM configured
# echo Making vim
# sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80
# echo Vim made
# echo Installing vim...
# sudo make install
# echo Vim installed

# Install NeoVim
#
# echo Installing Neovim
# First we have to get DNF and COPR
# cd /home/vagrant
# wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# sudo rpm -Uvh epel-release-latest-7*.rpm
# sudo mv /home/vagrant/dnf-stack-el7.repo /etc/yum.repos.d/dnf-stack-el7.repo
# sudo yum install -y epel-release
# sudo yum install -y dnf
# sudo yum install -y dnf-plugins-core
# Now we can get neovim - for CentOS
# sudo dnf copr enable dperson/neovim;
# sudo dnf install neovim
# sudo yum install -y neovim-0.2.0
# sudo apt-get install -y neovim

# Get Python pip so we can install the nvim module
#
cd /home/vagrant
# wget https://bootstrap.pypa.io/get-pip.py
# python get-pip.py
# pip install neovim

# Install Spacevim
# mkdir /home/vagrant/.config
# sudo chown -R vagrant /home/vagrant/.config
# curl -sLf https://spacevim.org/install.sh > /home/vagrant/install_spacevim.sh
# sudo chown vagrant install_spacevim.sh
# sudo chmod +x install_spacevim.sh
# runuser -l vagrant -c 'sh /home/vagrant/install_spacevim.sh'
# sh /home/vagrant/dotfiles/install_spacevim.sh

# Install irssi
# sudo yum install -y irssi
# echo Installing irssi...
# sudo apt-get install -y irssi
# echo Irssi installed

# Install Fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
sudo wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key -O "/etc/apt/trusted.gpg.d/shells:fish:release:3.asc"
sudo apt-get update
sudo apt-get install -y fish
# sudo chsh -s /usr/bin/fish
