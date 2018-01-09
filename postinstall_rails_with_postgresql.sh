rvm gemset create $1
rvm gemset use $1
gem install bundler
bundle install
sudo apt-get install postgresql postgresql-client
sudo su - postgres
echo $2 | createuser --createdb --encrypted --login
exit
