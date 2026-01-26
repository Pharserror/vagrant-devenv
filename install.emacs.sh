#!/usr/bin/env bash

# Use this file if you need to build Emacs from source
wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-30.1.tar.gz -O $HOME/source/emacs-30.1.tar.gz
cd $HOME/source && tar -xf emacs-30.1.tar.gz
cd $HOME/source/emacs-30.1 && sudo dnf builddep -y emacs
sudo ./configure
sudo make bootstrap
sudo make install
