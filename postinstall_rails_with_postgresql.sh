rvm gemset create $1
rvm gemset use $1
gem install bundler
bundle install
sudo su - postgres
echo $2 | createuser --createdb --encrypted --login
