#!/usr/bin/env bash

# Mod ssh keys' permissions
chmod 600 $HOME/.ssh/*

# +------------------------------------------------------------------------+
# |== DISABLE THIS STEP IF YOU ARE USING RSYNC TO SYNC YOUR SOURCE CODE ===|
# +------------------------------------------------------------------------+
echo "Running ruby post-install"
ruby $HOME/setup.rb
chmod +x ./configure.sh
./configure.sh
sudo chown -R $USER $HOME/source
echo "Ruby post-install complete"
