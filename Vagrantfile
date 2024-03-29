# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

DEFAULT_BOX = "generic/debian10"

Vagrant.configure("2") do |config|
  YAML.load_file('./config.yaml').each do |category, setting|
    case category
    when 'distro'
      config.vm.box = setting
    end
  end
  # Specify default box to use
  config.vm.box ||= DEFAULT_BOX
  # Windows doesn't like ||= or something: use the below line on Win10
  # config.vm.box = "generic/debian10"

  # Config provider memory and CPU
  config.vm.provider "docker" do |d|
    # d.cpus = 2
    d.image = "debian:buster"
    # d.memory = 4096
  end

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Private ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Setup any private networks
  # config.vm.network "private_network", ip: "55.55.55.55"

  # Setup any public networks
  config.vm.network "public_network"

  # Sync additional folders (host dir, box dir [, options])
  # Disable this if you are using the config.yaml setup
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Configure any providers
  #
  config.vm.provider "hyperv" do |h|
    # Customize the amount of memory on the VM:
    h.cpus = 2
    h.memory = 4096
  end

  # Configure any provisioning
  # NOTE: Might be able to use some env vars to make this generic
  # config.vm.provision "file", source: "./dnf-stack-el7.repo", destination: "/home/vagrant/dnf-stack-el7.repo"
  # Comment out the below line if you are using RSync for getting repos onto the VM
  config.vm.provision "file", source: "./config.yaml", destination: "/home/vagrant/config.yaml"
  config.vm.provision "file", source: "./setup.rb", destination: "/home/vagrant/setup.rb"
  # Some typical postinstall files you might have for a Rails/Node project
  # Comment out or remove these lines if you don't have postinstall scripts to run
  config.vm.provision "file", source: "./postinstall_rails_with_postgresql.sh", destination: "/home/vagrant/postinstall_rails_with_postgresql.sh"
  # config.vm.provision "file", source: "./postinstall_typical_npm.sh", destination: "/home/vagrant/postinstall_typical_npm.sh"
  config.vm.provision "file", source: "./postinstall_vitejs.sh", destination: "/home/vagrant/postinstall_vitejs.sh"
  config.vm.provision :shell, path: "./install1.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install-rvm.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install-ruby.sh", args: "2.7.3",  privileged: false
  # config.vm.provision :shell, path: "./install-nvm.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install-vitejs.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install2.sh",  args: "stable", privileged: false
end
