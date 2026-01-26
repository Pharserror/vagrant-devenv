#!/usr/bin/env bash

# Add X Config to start DWM
echo "exec dwm" > $HOME/.xinitrc && chmod +x $HOME/.xinitrc

# Install fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip
unzip IosevkaTerm.zip -d IosevkaTerm >> /dev/null
mkdir $HOME/.fonts
mv IosevkaTerm/IosevkaTermNerdFontMono-Regular.ttf $HOME/.fonts

# Install DWM
# This should already be cloned onto the machine by setup.rb
# git clone git://git.suckless.org/dwm $HOME/source/dwm
cp $HOME/source/dwm/config.def.h $HOME/source/dwm/config.h
sed -i -e 's/monospace:size=10/IosevkaTerm Nerd Font Mono:size=16/g' $HOME/source/dwm/config.h
# Comment out xinerama since we don't need it
sed -i -e 's/^XINERAMALIBS/# XINERAMALIBS/g' $HOME/source/dwm/config.mk
sed -i -e 's/^XINERAMAFLAGS/# XINERAMAFLAGS/g' $HOME/source/dwm/config.mk
cd $HOME/source/dwm && sudo make clean install

# Install ST
# This should already be cloned onto the machine by setup.rb
# git clone git://git.suckless.org/st $HOME/source/st
cp $HOME/source/st/config.def.h $HOME/source/st/config.h
sed -i -e 's/Liberation Mono:pixelsize=12/IosevkaTerm Nerd Font Mono:pixelsize=18/g' $HOME/source/st/config.h
# Use Solarized Light Theme
wget https://st.suckless.org/patches/solarized/st-no_bold_colors-20170623-b331da5.diff -O $HOME/source/st/st-no_bold_colors.diff
wget https://st.suckless.org/patches/solarized/st-solarized-light-0.8.5.diff -O $HOME/source/st/st-solarized-light.diff
cd $HOME/source/st && git apply st-no_bold_colors.diff && git apply st-solarized-light.diff && sudo make clean install
