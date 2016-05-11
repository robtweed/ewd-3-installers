#!/usr/bin/env bash

# Set up an ewd-xpress / React.js development environment

cd ~/ewd3

npm install react@0.14 react-dom@0.14 babelify babel-preset-react react-bootstrap react-toastr react-select socket.io-client@1.3.7
npm install jquery ewd-client ewd-react-tools ewd-xpress-react

npm install -g browserify

cd ~/ewd3/www/ewd-xpress-monitor
npm install babel-preset-es2015

# Now you can compile an application bundle:
#  cd ~/ewd3/www/ewd-xpress-monitor
#  browserify -t [ babelify --presets [es2015 react] ] app.js -o bundle.js

