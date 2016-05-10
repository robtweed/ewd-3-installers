#!/usr/bin/env bash

# Installs a pre-built simple HTML / JavaScript ewd-xpress application

# Install the client-side JavaScript file (ewd-client.js)

cd ~/ewd3
npm install ewd-client
cp ~/ewd3/node_modules/ewd-client/lib/proto/ewd-client.js ~/ewd3/www

# Install the simple example application

cd ~/ewd3/www
mkdir test-app

cp ~/ewd3/node_modules/ewd-xpress/example/test-app/index.html ~/ewd3/www/test-app
cp ~/ewd3/node_modules/ewd-xpress/example/test-app/node_modules/test-app.js ~/ewd3/node_modules

cd ~
echo 'Done!'