# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

# Our postgres/redis containers in Docker are built from alpine 3.12
DEFAULT_BOX = "generic/alpine312"

Vagrant.configure("2") do |config|
  # Specify default box to use
  config.vm.box ||= DEFAULT_BOX

  # Config provider memory and CPU
  config.vm.provider "docker" do |d|
    d.image = "alpine:3.12"
  end

  # Configure box updates
  # config.vm.box_check_update = false

  # Public ports
  config.vm.network "forwarded_port", guest: 8080, host: 8080 # Webserver
  config.vm.network "forwarded_port", guest: 5432, host: 5432 # Postgres
  config.vm.network "forwarded_port", guest: 6379, host: 6379 # Redis
  config.vm.network "forwarded_port", guest: 9200, host: 9200 # ElasticSearch
  config.vm.network "forwarded_port", guest: 9300, host: 9300 # ElasticSearch

  # Private ports
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Setup any private networks
  # config.vm.network "private_network", ip: "55.55.55.55"

  # Setup any public networks
  config.vm.network "public_network"

  # Sync the repo
  config.vm.synced_folder "..", "/home/vagrant/source/my_project"

  # Configure any provisioning
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
  config.vm.provision :shell, path: "./install_postgres.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install_redis.sh",  args: "stable", privileged: false
  config.vm.provision :shell, path: "./install_elasticsearch.sh",  args: "stable", privileged: false
end
