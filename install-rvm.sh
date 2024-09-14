#!/usr/bin/env bash
#
# Alpine install
#
curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz
echo 'export rvm_prefix="$HOME"' > ~/.rvmrc
echo 'export rvm_path="$HOME/.rvm"' >> ~/.rvmrc
mkdir rvm && cd rvm
tar --strip-components=1 -xzf ../rvm-stable.tar.gz
./install --auto-dotfiles --autolibs=0
#
# Remove some files, probably not needed
# cd ../ && rm -rf rvm-stable stable.tar.gz rvm
# source ~/.rvm/scripts/rvm
#
#
# Not Alpine Linux install
#
# command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -;
# gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# curl -sSL https://get.rvm.io | bash -s $1;
#
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> /home/vagrant/.bashrc;
#
# non-Privileged Install
# sudo adduser vagrant rvm;
#
# Fish Shell Functions
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
echo "rvm default" >> ~/.config/fish/config.fish
