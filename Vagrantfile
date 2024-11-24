# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

Vagrant.configure("2") do |config|
  # Specify box to use
  config.vm.box = "generic/alpine318"

  # Config provider memory and CPU
  # config.vm.provider "docker" do |d|
  #   d.image = "alpine:3.20"
  # end
  # config.vm.provider "hyperv" do |d|
  # end

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # API1
  config.vm.network "forwarded_port", guest: 3001, host: 3001 # API2
  config.vm.network "forwarded_port", guest: 5173, host: 5173 # Vite
  config.vm.network "forwarded_port", guest: 5432, host: 5432 # Postgres
  config.vm.network "forwarded_port", guest: 6379, host: 6379 # Redis
  config.vm.network "forwarded_port", guest: 8080, host: 8080 # Webserver
  config.vm.network "forwarded_port", guest: 9200, host: 9200 # ElasticSearch
  config.vm.network "forwarded_port", guest: 9300, host: 9300 # ElasticSearch

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
  config.vm.provision "file", source: "./self.github.com", destination: "/home/vagrant/.ssh/self.github.com"
  config.vm.provision "file", source: "./self.gitlab.com", destination: "/home/vagrant/.ssh/self.gitlab.com"
  config.vm.provision :shell, path: "./install1.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install2.sh",  args: "stable", privileged: false
end
