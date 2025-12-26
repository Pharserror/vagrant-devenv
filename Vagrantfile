# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

Vagrant.configure("2") do |config|
  # Specify box to use
  # +==========================================================================+
  # | ------------------------- GENERIC NIX BOXES ---------------------------- |
  # +==========================================================================+
  # config.vm.box = "generic/debian12"
  # +==========================================================================+
  # | ------------------------ APPLE SILICON BOXES --------------------------- |
  # +==========================================================================+
  ##############################################################################
  # APT Boxes
  ##############################################################################
  # config.vm.box = "bento/debian-12"
  # config.vm.box_version = "202502.21.0"
  ##############################################################################
  # RHEL Boxes
  ##############################################################################
  # config.vm.box = "bento/rockylinux-9"
  # config.vm.box_version = "202502.21.0"
  ##############################################################################
  # APK Boxes
  ##############################################################################

  # +==========================================================================+
  # | --------------------------- Libvirt SETUP ------------------------------- |
  # +==========================================================================+
  config.vm.box = "generic/debian12"
  config.vm.provider "libvirt" do |libvirt|
    libvirt.driver = "kvm"
    libvirt.memory = 1024
    libvirt.cpus = 1
  end
  # +==========================================================================+
  # | --------------------------- VMWare SETUP ------------------------------- |
  # +==========================================================================+
  # config.vm.provider "vmware_desktop"
  # +==========================================================================+
  # | --------------------------- HYPER-V SETUP ------------------------------ |
  # +==========================================================================+
  # Config provider memory and CPU
  # config.vm.provider "hyperv" do |d|
  #   d.cpus = 4
  #   d.maxmemory = nil
  #   d.memory = 4096
  # end

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  config.vm.network "forwarded_port", guest: 22,    host: 2222  # SSH
  config.vm.network "forwarded_port", guest: 80,    host: 80    # HTTP
  config.vm.network "forwarded_port", guest: 443,   host: 443   # HTTPS
  config.vm.network "forwarded_port", guest: 10667, host: 10667 # DOOM/Zandronum
  config.vm.network "forwarded_port", guest: 3000,  host: 3000  # API1
  config.vm.network "forwarded_port", guest: 3001,  host: 3001  # API2
  config.vm.network "forwarded_port", guest: 3002,  host: 3002  # API3
  config.vm.network "forwarded_port", guest: 5173,  host: 5173  # Vite
  config.vm.network "forwarded_port", guest: 5432,  host: 5432  # Postgres
  config.vm.network "forwarded_port", guest: 6379,  host: 6379  # Redis
  config.vm.network "forwarded_port", guest: 8000,  host: 8000  # Django
  config.vm.network "forwarded_port", guest: 8080,  host: 8080  # Webserver
  config.vm.network "forwarded_port", guest: 9200,  host: 9200  # ElasticSearch
  config.vm.network "forwarded_port", guest: 9300,  host: 9300  # ElasticSearch

  # Private ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Setup any private networks
  # config.vm.network "private_network", ip: "55.55.55.55"

  # Setup any public networks
  config.vm.network "public_network"

  # Sync the repo
  # config.vm.synced_folder "..", "/home/vagrant/source/my_project"

  # Configure any provisioning
  config.vm.provision "file", source: "./config.yaml", destination: "/home/vagrant/config.yaml"
  config.vm.provision "file", source: "./dotfiles.sh", destination: "/home/vagrant/dotfiles.sh"
  config.vm.provision "file", source: "./setup.rb", destination: "/home/vagrant/setup.rb"
  config.vm.provision "file", source: "./standup.sh", destination: "/home/vagrant/standup.sh"
  # config.vm.provision "file", source: "./self.digital", destination: "/home/vagrant/.ssh/self.digital"
  config.vm.provision "file", source: "./self.github.com", destination: "/home/vagrant/.ssh/self.github.com"
  config.vm.provision "file", source: "./self.gitlab.com", destination: "/home/vagrant/.ssh/self.gitlab.com"
  config.vm.provision :shell, path: "./pre_install.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.apk.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install.debian.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.rhel.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install.docker.debian.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.docker.rhel.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.emacs.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install.spacemacs.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.spacevim.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install2.sh",  args: "stable", privileged: false
end
