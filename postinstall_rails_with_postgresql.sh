sudo apt-get install -y postgresql postgresql-client libpq-dev;
# Source RVM since on vagrant up it never remembers that it's already installed
# Privileged
# source /usr/local/rvm/scripts/rvm || source /etc/profile.d/rvm.sh;
# Non-privileged
source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
cd /home/vagrant/source/$1; rvm gemset create $2; rvm gemset use $2; gem install bundler:$3; bundle install;
# sudo su - vagrant
# Start the postgres cluster
sudo su - postgres; pg_ctlcluster 11 main start;
echo $4 | createuser --createdb --encrypted --login
exit
