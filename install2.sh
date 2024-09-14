#!/usr/bin/env bash

# Setup stuff from the config
# +------------------------------------------------------------------------+
# |== DISABLE THIS SETUP IF YOU ARE USING RSYNC TO SYNC YOUR SOURCE CODE ==|
# +------------------------------------------------------------------------+
echo "Running ruby post-install"
ruby /home/vagrant/setup.rb
chmod +x ./configure.sh
./configure.sh
sudo chown -R vagrant /home/vagrant/source
echo "Ruby post-install complete"
