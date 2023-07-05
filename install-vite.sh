# Fish Setup
# -- Setup Fisher --
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
#
# -- Setup Bass --
fisher add edc/bass
#
# -- Install asdf --
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
echo "\n"'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
sudo apt-get install -y dirmngr gpg curl gawk

# -- Install Node --
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.16.1
asdf global nodejs 18.16.1

# Spacemacs TIDE server setup
npm install -g typescript

# Spacemacs React layer setup
npm install -g tern eslint babel-eslint eslint-plugin-react
