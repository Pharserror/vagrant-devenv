#!/usr/bin/env bash

# Non-privileged
source /home/vagrant/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
# Privileged Install
# source /usr/local/rvm/scripts/rvm || source /etc/profile.d/rvm.sh

rvm use --default --install $1

shift

if (( $# ))
then gem install $@
fi

rvm cleanup all
