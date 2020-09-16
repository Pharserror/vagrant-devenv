#!/usr/bin/env bash

# setup directories
mkdir -p /home/vagrant/dotfiles
# mkdir -p /home/vagrant/.emacs.d

# install base packages
# sudo yum update
# sudo yum groupinstall -y "Development Tools"
# sudo yum install -y git nodejs tmux curl tar gzip wget lua lua-devel luajit \
#                     luajit-devel ctags python python-devel python3 python3-devel \
#                     tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
#                     perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel ruby-devel
sudo apt-get update
sudo apt-get install -y git tmux curl tar wget perl gnupg2 ripgrep # \
#                       #
#                       # Use for when you want to build emacs
#                       # build-essential emacs python python3

# Use if you're building emacs from source - don't forget to remove emacs from above
# sudo apt-get install y- gtk+3.0 libwebkit2gtk-3.0 webkitgtk+2 \
#                         webkitgtk+3.0 libwebkitgtk-dev libwebkitgtk-3.0-dev

# build emacs - NOTE: use env var for version
# cd /home/vagrant
# echo Downloading emacs...
# wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
# echo Emacs downloaded
# tar -xf emacs-25.2.tar.gz
# cd /home/vagrant/emacs-25.2/
# echo Installing emacs dependencies...
# sudo apt-get build-dep -y emacs25
# echo Emacs deps installed
# echo Configuring emacs...
# sudo ./configure --with-cairo --with-xwidgets --with-x-toolkit=gtk3
# echo Emacs configured
# echo Making emacs...
# sudo make
# echo Emacs made
# echo Installing emacs...
# sudo make install
# echo Emacs installed

# Grab dotfiles
git clone https://github.com/Pharserror/dotfiles.git /home/vagrant/dotfiles
sudo chown -R vagrant /home/vagrant/dotfiles
sh /home/vagrant/dotfiles/install.sh

# Use this if you don't want to use the emacs Docker container
#
# Install Spacemacs
# echo Cloning spacemacs...
# git clone https://github.com/syl20bnr/spacemacs /home/vagrant/.emacs.d
# echo Spacemacs cloned
# sudo chown -R vagrant /home/vagrant/.emacs.d
# mkdir /home/vagrant/.emacs.d/.cache
# sudo chown -R vagrant /home/vagrant/.emacs.d/.cache

# Install Vim8
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
