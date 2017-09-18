#!/usr/bin/env bash

# Install Ripgrep
# sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlgeorge/ripgrep/repo/epel-7/carlgeorge-ripgrep-epel-7.repo
# sudo yum install -y ripgrep
echo Downloading Rust installer...
curl https://sh.rustup.rs -sSf > /home/vagrant/installrust.sh
echo Rust installer downloaded
sudo chown vagrant /home/vagrant/installrust.sh
sudo chmod +x /home/vagrant/installrust.sh
echo Installing Rust...
./installrust.sh -y
source $HOME/.cargo/env
echo Rust installed
echo Installing Ripgrep...
cargo install ripgrep
echo Ripgrep installed
cd /home/vagrant

# Setup stuff from the config
mkdir /home/vagrant/source
sudo chown -R vagrant /home/vagrant/source
echo Running ruby post-install
ruby /home/vagrant/setup.rb
echo Ruby post-install complete
