#!/usr/bin/env bash

# Install GlobalsDB, Node.js and EWD 3 ewd-xpress on Ubuntu System

# Update first just to be sure

sudo apt-get update
sudo apt-get install -y wget gzip openssh-server curl

# Install GlobalsDB

# First increase shared memory quotas

sudo sysctl -w kernel.shmall=536870912
sudo sysctl -w kernel.shmmax=536870912
sudo /bin/su -c "echo 'kernel.shmall=536870912' >> /etc/sysctl.conf"
sudo /bin/su -c "echo 'kernel.shmmax=536870912' >> /etc/sysctl.conf"

cd ~
wget https://s3-eu-west-1.amazonaws.com/globalsdb/globals_2013.2.0.350.0_unix.tar.gz

gzip -cd globals_2013.2.0.350.0_unix.tar.gz | tar -x
rm globals_2013.2.0.350.0_unix.tar.gz
cd kit_unix_globals
mkdir ~/globalsdb
ISC_QUIET=yes
export ISC_QUIET
ISC_TGTDIR=~/globalsdb
export ISC_TGTDIR
ISC_PLATFORM=lnxsusex64
export ISC_PLATFORM
./installGlobals

cd ~
rm -rf kit_unix_globals

# Install NVM

curl https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | sh
source ~/.nvm/nvm.sh

# Now install latest Node.js 4.x

nvm alias default 4
nvm install 4
nvm use default
echo 'nvm use default' >> ~/.profile

# Now ready to install ewd-xpress

cd ~
mkdir ewd3
cd ewd3
npm install ewd-xpress ewd-xpress-monitor
npm install ewd-client

# Load the latest cache.node interface module and move it into the correct place

cd ~/ewd3/node_modules
wget https://s3-eu-west-1.amazonaws.com/cache.node/build-124/linux/cache421.node
mv cache421.node cache.node

# Finally move various files into place:

cp ~/ewd3/node_modules/ewd-xpress/example/ewd-xpress-globalsdb.js ~/ewd3/ewd-xpress.js


cd ~/ewd3
mkdir www
cd www
mkdir ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/bundle.js ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.html ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.css ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-client/lib/proto/ewd-client.js ~/ewd3/www/ewd-client.js

cd ~/ewd3

echo 'Done!'
echo 'Start ewd-xpress using: node ewd-xpress'



 