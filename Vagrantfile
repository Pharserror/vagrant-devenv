# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Specify box to use
  # config.vm.box = "centos/7"
  config.vm.box = "debian/stretch64"

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
  # config.vm.provision "file", source: "./dnf-stack-el7.repo", destination: "/home/vagrant/dnf-stack-el7.repo"
  config.vm.provision "file", source: "./config.yaml", destination: "/home/vagrant/config.yaml"
  config.vm.provision "file", source: "./setup.rb", destination: "/home/vagrant/setup.rb"
  config.vm.provision :shell, path: "./install1.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install-rvm.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install-ruby.sh", args: "2.4.1",  privileged: false
  config.vm.provision :shell, path: "./install2.sh",  args: "stable", privileged: false
end
