#!/usr/bin/env bash

# Install Ripgrep
# CentOS/Fedora/RedHat
# sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlgeorge/ripgrep/repo/epel-7/carlgeorge-ripgrep-epel-7.repo
# sudo yum install -y ripgrep
#
# Debian/Ubuntu
sudo apt install -y ripgrep

# Installation with Rust
# ls /home/vagrant/.cargo/bin/rg &> /dev/null
# if [ $? -eq 0 ]; then
#   echo Downloading Rust installer...
#   curl https://sh.rustup.rs -sSf > /home/vagrant/installrust.sh
#   echo Rust installer downloaded
#   sudo chown vagrant /home/vagrant/installrust.sh
#   sudo chmod +x /home/vagrant/installrust.sh
#   echo Installing Rust...
#   ./installrust.sh -y
#   source $HOME/.cargo/env
#   echo Rust installed
#   echo Installing Ripgrep...
#   cargo install ripgrep
#   echo Ripgrep installed
# fi
cd /home/vagrant

# Setup stuff from the config
# +------------------------------------------------------------------------+
# |== DISABLE THIS SETUP IF YOU ARE USING RSYNC TO SYNC YOUR SOURCE CODE ==|
# +------------------------------------------------------------------------+
echo "Running ruby post-install"
ruby /home/vagrant/setup.rb
chmod +x ./configure.sh
./configure.sh
sudo chown -R vagrant /home/vagrant/source
echo "Ruby post-install complete"
