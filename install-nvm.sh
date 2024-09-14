# Fish Setup
# -- Setup Fisher --
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
#
# -- Setup Bass --
fish -c "fisher add edc/bass"
#
# -- Install NVM --
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash;
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ];
printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")";
[ -s "$NVM_DIR/nvm.sh" ]; \. "$NVM_DIR/nvm.sh" # This loads nvm;
nvm install node;
nvm install-latest-npm;

# Spacemacs TIDE server setup
npm install -g typescript

# Spacemacs React layer setup
npm install -g tern eslint babel-eslint eslint-plugin-react
