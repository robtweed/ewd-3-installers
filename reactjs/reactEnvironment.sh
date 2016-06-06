#!/usr/bin/env bash

# Set up an ewd-xpress / React.js development environment

cd ~/ewd3

npm install react react-dom babelify babel-preset-react react-bootstrap react-toastr react-select socket.io-client
npm install jquery ewd-client ewd-react-tools ewd-xpress-react

npm install -g browserify
npm install -g uglify-js

cd ~/ewd3/www/ewd-xpress-monitor
npm install babel-preset-es2015

# Now you can compile an application bundle:
#  cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.js ~/ewd3/www/ewd-xpress-monitor
#  cd ~/ewd3/www/ewd-xpress-monitor
#  or
#  cd ~/ewd3/node_modules/ewd-xpress-monitor/www
#  browserify -t [ babelify --compact false --presets [es2015 react] ] app.js | uglifyjs > bundle.js
#  cp ~/ewd3/node_modules/ewd-xpress-monitor/www/bundle.js ~/ewd3/www/ewd-xpress-monitor
