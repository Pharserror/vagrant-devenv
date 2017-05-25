# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Specify box to use
  config.vm.box = "centos/7"

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Private ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Setup any private networks
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Setup any public networks
  # config.vm.network "public_network"

  # Sync additional folders (host dir, box dir [, options])
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Configure any providers
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  # Define any pushing strategy
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Configure any provisioning
  # NOTE: Might be able to use some env vars to make this generic
  config.vm.provision "shell", inline: <<-SHELL
    # setup directories
    sudo mkdir -p /home/vagrant/dotfiles
    sudo mkdir -p /home/vagrant/.emacs.d
    # install packages
    sudo yum update
    sudo yum groupinstall "Development Tools"
    sudo yum install -y git nodejs tmux zsh curl tar gzip wget
    # build emacs - NOTE: use env var for version
    cd /home/vagrant
    wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
    tar -xf emacs-25.2.tar.gz
    cd emacs-25.2
    ./configure
    make
    cd /home/vagrant
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
    git clone https://github.com/Pharserror/dotfiles /home/vagrant/dotfiles
    cd /home/vagrant/dotfiles
    ./install.sh
    git clone https://github.com/syl20bnr/spacemacs /home/vagrant/.emacs.d
  SHELL
end
