# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Specify box to use
  # config.vm.box = "centos/7"
  config.vm.box = "debian/9"

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  config.vm.network "forwarded_port", guest: 19000, host: 19000

  # Private ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Setup any private networks
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Setup any public networks
  config.vm.network "public_network"

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
  config.vm.provision "file", source: "./dnf-stack-el7.repo", destination: "/home/vagrant/dnf-stack-el7.repo"
  config.vm.provision "file", source: "./config.yaml", destination: "/home/vagrant/config.yaml"
  config.vm.provision "file", source: "./setup.rb", destination: "/home/vagrant/setup.rb"
  config.vm.provision "shell", inline: <<-SHELL
    # Use Vagrant user to do stuff
    su - vagrant

    # setup directories
    mkdir -p /home/vagrant/dotfiles
    mkdir -p /home/vagrant/.emacs.d

    # install base packages
    # sudo yum update
    # sudo yum groupinstall -y "Development Tools"
    # sudo yum install -y git nodejs tmux zsh curl tar gzip wget lua lua-devel luajit \
    #                     luajit-devel ctags python python-devel python3 python3-devel \
    #                     tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
    #                     perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel
    sudo apt-get update
    sudo apt-get install -y build-essential git nodejs tmux zsh curl tar gzip wget lua lua-devel luajit \
                        luajit-devel ctags python python-devel python3 python3-devel \
                        tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
                        perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel

    # build emacs - NOTE: use env var for version
    cd /home/vagrant
    wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
    tar -xf emacs-25.2.tar.gz
    cd /home/vagrant/emacs-25.2/
    sudo ./configure
    sudo make
    sudo make install

    # Install RVM
    command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
    source /home/vagrant/.rvm/scripts/rvm
    sudo yum install -y ruby-devel

    # Grab dotfiles
    git clone https://github.com/Pharserror/dotfiles.git /home/vagrant/dotfiles
    sudo chown -R vagrant /home/vagrant/dotfiles
    sh /home/vagrant/dotfiles/install.sh

    # Install Spacemacs
    git clone https://github.com/syl20bnr/spacemacs /home/vagrant/.emacs.d
    sudo chown -R vagrant /home/vagrant/.emacs.d
    mkdir /home/vagrant/.emacs.d/.cache
    sudo chown -R vagrant /home/vagrant/.emacs.d/.cache

    # Install Vim8
    git clone https://github.com/vim/vim.git /home/vagrant/vim
    cd /home/vagrant/vim/
    sudo ./configure
    sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80
    sudo make install

    # Install NeoVim
    # First we have to get DNF and COPR
    cd /home/vagrant
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo rpm -Uvh epel-release-latest-7*.rpm
    sudo mv /home/vagrant/dnf-stack-el7.repo /etc/yum.repos.d/dnf-stack-el7.repo
    sudo yum install -y epel-release
    sudo yum install -y dnf
    sudo yum install -y dnf-plugins-core
    # Now we can get neovim
    sudo dnf copr enable dperson/neovim;
    # sudo dnf install neovim
    sudo yum install -y neovim-0.2.0

    # Get Python pip so we can install the nvim module
    cd /home/vagrant
    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    pip install neovim

    # Install Spacevim
    mkdir /home/vagrant/.config
    sudo chown -R vagrant /home/vagrant/.config
    sudo curl -sLf https://spacevim.org/install.sh > /home/vagrant/install.sh
    sudo chown vagrant install.sh
    sudo chmod +x install.sh
    runuser -l vagrant -c 'sh /home/vagrant/install.sh'

    # Install irssi
    sudo yum install -y irssi

    # Install Ripgrep
    sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlgeorge/ripgrep/repo/epel-7/carlgeorge-ripgrep-epel-7.repo
    sudo yum install -y ripgrep

    # Setup stuff from the config
    mkdir /home/vagrant/source
    sudo chown -R vagrant /home/vagrant/source
    ruby /home/vagrant/setup.rb
  SHELL
end
