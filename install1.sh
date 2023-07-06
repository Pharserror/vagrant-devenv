#!/usr/bin/env bash
touch /home/vagrant/.bashrc

# Setup directories
mkdir -p /home/vagrant/source

# Install dependencies/required packages
apk update
apk add --no-cache git bash build-base libffi-dev openssl-dev bzip2-dev zlib-dev xz-dev readline-dev sqlite-dev tk-dev curl tar wget perl gpg gawk linux-headers

# Install asdf for managing binary versions
cd /home/vagrant/source
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
echo ". $HOME/.asdf/asdf.sh" >> /home/vagrant/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> /home/vagrant/.bashrc

# Install Node/NPM
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.17.1
asdf global nodejs 16.17.1

# Install Python
asdf plugin-add python
asdf install python 3.10.8
asdf global python 3.10.8

# Configure AWS
echo "export AWS_PROFILE=local" >> /home/vagrant/.bashrc
echo "export AWS_REGION=us-east-1" >> /home/vagrant/.bashrc

cd /home/vagrant
