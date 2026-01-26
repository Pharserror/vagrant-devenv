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
  # config.vm.box = "generic/alpine318"

  # +==========================================================================+
  # | --------------------------- LXC    SETUP ------------------------------- |
  # +==========================================================================+
  # config.vm.box = "generic/debian12"
  # config.vm.provider "lxc" do |lxc|
  #   lxc.driver = "kvm"
  #   lxc.memory = 1024
  #   lxc.cpus = 1
  # end
  # +==========================================================================+
  # | --------------------------- Libvirt SETUP ------------------------------- |
  # +==========================================================================+
  # config.vm.box = "generic/debian12"
  # config.vm.provider "libvirt" do |libvirt|
  #   libvirt.driver = "kvm"
  #   libvirt.memory = 1024
  #   libvirt.cpus = 1
  # end
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
  # +==========================================================================+
  # | ------------------------ Digital Ocean SETUP --------------------------- |
  # +==========================================================================+
  config.vm.define "droplet" do |droplet_config|
    droplet_config.vm.provider "digital_ocean" do |provider, override|
      override.ssh.private_key_path = "~/.ssh/self.digital"
      # override.ssh.username = "#{ENV['DIGITAL_OCEAN_SSH_USERNAME']}"
      override.vm.box = "digital_ocean"
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      provider.ssh_key_name = "self.digital"
      provider.token = "#{ENV['DIGITAL_OCEAN_TOKEN']}"
      provider.image = "#{ENV['DIGITAL_OCEAN_IMAGE_ID']}"
      provider.region = "#{ENV['DIGITAL_OCEAN_REGION']}"
      provider.size = "#{ENV['DIGITAL_OCEAN_PROVIDER_SIZE']}"
      provider.setup = false
      # provider.backups_enabled = false
      # provider.private_networking = false
      # provider.ipv6 = false
      # provider.monitoring = true
    end
  end

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  # FIXME: Move this to a JSON file the user can define
  config.vm.network "forwarded_port", guest: 22,    host: 2222  # SSH
  config.vm.network "forwarded_port", guest: 80,    host: 80    # HTTP
  config.vm.network "forwarded_port", guest: 443,   host: 443   # HTTPS
  config.vm.network "forwarded_port", guest: 10667, host: 10667, protocol: "tcp" # DOOM/Zandronum
  config.vm.network "forwarded_port", guest: 10667, host: 10667, protocol: "udp" # DOOM/Zandronum
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
  # config.vm.synced_folder "..", "$HOME/source/my_project"

  # Configure any provisioning
  config.vm.provision "file", source: "./envs", destination: "$HOME/envs"
  config.vm.provision "file", source: "./config.yaml", destination: "$HOME/config.yaml"
  # config.vm.provision "file", source: "./dotfiles.sh", destination: "$HOME/dotfiles.sh"
  config.vm.provision "file", source: "./setup.rb", destination: "$HOME/setup.rb"
  config.vm.provision "file", source: "./standup.sh", destination: "$HOME/standup.sh"
  # config.vm.provision "file", source: "./self.digital", destination: "$HOME/.ssh/self.digital"
  config.vm.provision "file", source: "./self.github.com", destination: "$HOME/.ssh/self.github.com"
  config.vm.provision "file", source: "./self.github.com.pub", destination: "$HOME/.ssh/self.github.com.pub"
  config.vm.provision "file", source: "./self.gitlab.com", destination: "$HOME/.ssh/self.gitlab.com"
  config.vm.provision "file", source: "./self.gitlab.com.pub", destination: "$HOME/.ssh/self.gitlab.com.pub"
  config.vm.provision :shell, path: "./addusers.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./pre_install.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.apk.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.debian.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install.debian.prod.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.rhel.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install.docker.debian.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.docker.rhel.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.emacs.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.spacemacs.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install.spacevim.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./setup.sh",  args: "stable", privileged: false
  # config.vm.provision :shell, path: "./install2.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./post_install.sh",  args: "stable", privileged: false
end
