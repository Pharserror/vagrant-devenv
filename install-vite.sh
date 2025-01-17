# Fish Setup
# -- Setup Fisher --
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
#
# -- Setup Bass --
fish -c "fisher install edc/bass"

#
# -- Install asdf --
echo "" >> ~/.config/fish/config.fish
echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
# APT-based install
# sudo apt-get install -y dirmngr gpg curl gawk

source /home/vagrant/.bashrc
# -- Install Node --
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# We have to set this envvar b/c Nodejs does not provide official binaries for Alpine
# NOTE: Because this is so slow and we don't actually need asdf or any binaries
# if we use Docker for them, I'm opting for Docker at the time of writing this
ASDF_NODEJS_FORCE_COMPILE=1 asdf install nodejs 18.20.4
asdf global nodejs 18.20.4

# Spacemacs TIDE server setup
npm install -g typescript

# Spacemacs React layer setup
npm install -g tern eslint # babel-eslint eslint-plugin-react
