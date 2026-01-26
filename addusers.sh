#!/usr/bin/env bash

# Depending on the provider the Vagrant user may or may not be created
if id "vagrant" &>/dev/null; then
    echo "user vagrant already exists"
else
    adduser --home /vagrant/home --shell /bin/sh --uid 1000 --gecos "vagrant, , , " --disabled-password --disabled-login vagrant
fi
