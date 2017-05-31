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
    su - vagrant
    # setup directories
    mkdir -p /home/vagrant/dotfiles
    mkdir -p /home/vagrant/.emacs.d
    # install packages
    sudo yum update
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y git nodejs tmux zsh curl tar gzip wget lua lua-devel luajit \
                        luajit-devel ctags python python-devel python3 python3-devel \
                        tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
                        perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel
    # symlink xsubpp (perl) from /usr/bin to the perl dir
    # sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp
    # build emacs - NOTE: use env var for version
    wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.2.tar.gz
    tar -xf emacs-25.2.tar.gz
    cd /home/vagrant/emacs-25.2/
    sudo ./configure
    sudo make
    sudo make install
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
    sudo yum install -y ruby-devel
    git clone https://github.com/Pharserror/dotfiles /home/vagrant/dotfiles
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
    sudo yum -y install epel-release
    mkdir -p /etc/yum.repos.d/dperson-neovim
    curl -o /etc/yum.repos.d/dperson-neovim/epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
    sudo yum -y install neovim
	# Install Spacevim
    cd /home/vagrant
	sudo curl -sLf https://spacevim.org/install.sh | bash
  SHELL
end
