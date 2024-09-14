# APT
# sudo apt-get install -y postgresql postgresql-client libpq-dev;
#
# APK
sudo apk add postgresql15 postgresql15-contrib postgresql15-openrc libpq-dev;
#
# Source RVM since on vagrant up it never remembers that it's already installed
# Privileged
# source /usr/local/rvm/scripts/rvm || source /etc/profile.d/rvm.sh;
# Non-privileged
source /home/vagrant/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh;
cd /home/vagrant/source/$1; rvm gemset create $2; rvm gemset use $2; gem install bundler:$3; bundle install;
# sudo su - vagrant
# Start the postgres cluster
# APT-based Systems
# sudo su - postgres; pg_ctlcluster 15 main start;
#
# APK/Alpine
rc-update add postgresql;
rc-service postgresql start;

echo $4 | createuser --createdb --encrypted --login;
exit
