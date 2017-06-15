rgc $1
rgu $1
gem install bundler
bundle install
sudo su - postgres
echo $2 | createuser --createdb --encrypted --login
