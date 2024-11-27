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

# Install DWM
# This should already be cloned onto the machine by setup.rb
# git clone git://git.suckless.org/dwm /home/vagrant/source/dwm
cp /home/vagrant/source/dwm/config.def.h /home/vagrant/source/dwm/config.h
sed -i -e 's/monospace:size=10/IosevkaTerm Nerd Font Mono:size=16/g' /home/vagrant/source/dwm/config.h
# Comment out xinerama since we don't need it
sed -i -e 's/^XINERAMALIBS/# XINERAMALIBS/g' /home/vagrant/source/dwm/config.mk
sed -i -e 's/^XINERAMAFLAGS/# XINERAMAFLAGS/g' /home/vagrant/source/dwm/config.mk
cd /home/vagrant/source/dwm && sudo make clean install

# Install ST
# This should already be cloned onto the machine by setup.rb
# git clone git://git.suckless.org/st /home/vagrant/source/st
cp /home/vagrant/source/st/config.def.h /home/vagrant/source/st/config.h
sed -i -e 's/Liberation Mono:pixelsize=12/IosevkaTerm Nerd Font Mono:pixelsize=18/g' /home/vagrant/source/st/config.h
cd /home/vagrant/source/st && sudo make clean install

# Mod ssh keys' permissions
chmod 600 /home/vagrant/.ssh/*