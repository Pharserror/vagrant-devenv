# dpkg -s nodejs &> /dev/null
# if [ $? -eq 0 ]; then
#   echo "Installing Node"
#   curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
#   echo "Installing NPM"
#   sudo apt-get install -y nodejs npm
# fi
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ];
printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")";
[ -s "$NVM_DIR/nvm.sh" ]; \. "$NVM_DIR/nvm.sh" # This loads nvm;
cd $1
npm install -g webpack webpack-cli; npm install; webpack --config webpack.config.js
