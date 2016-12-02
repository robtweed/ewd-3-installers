#!/usr/bin/env bash

cd ~

apt-get update

# Install NVM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# Use it to install Node v 6.x

nvm install 6

# Next, install Redis

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz

# rename the created redis directory to just redis

mv redis-stable redis
cd redis

# build Redis

echo "Building Redis - be patient, this will take some time!"

make
sudo make install
cd utils
sudo ./install_server.sh

echo "Redis is now installed and running, listening on port 6379"

# Now install EWD 3 / ewd-xpress

cd ~
mkdir ewd3
npm install ewd-xpress ewd-xpress-monitor

# ewd-express

echo 'Moving ewd-express files into place'

mv ~/ewd3/node_modules/ewd-xpress/example/ewd-xpress-rpi.js ~/ewd3/ewd-xpress.js
mv ~/ewd3/node_modules/ewd-redis-globals/lib/netx/rpi/netx.node ~/ewd3/node_modules/netx.node

cd ~/ewd3
mkdir www
cd www
mkdir ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/bundle.js ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.html ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.css ~/ewd3/www/ewd-xpress-monitor

cd ~/ewd3

echo 'Done!'
echo 'You should now be able to start ewd-xpress by typing: node ewd-xpress'
