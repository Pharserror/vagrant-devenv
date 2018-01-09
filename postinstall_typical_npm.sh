dpkg -s nodejs &> /dev/null
if [ $? -eq 0 ]; then
  curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi
cd $1
npm install -g webpack
npm install
webpack --config webpack.config.js
