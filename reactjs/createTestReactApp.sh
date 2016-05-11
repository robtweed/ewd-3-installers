#!/usr/bin/env bash

# Pulls in a basic React.js / react-bootstrap demonstration application
#  from the ewd-xpress-react module,
#  for learning and understanding the design pattern recommended for use
#  with EWD 3 / ewd-xpress

# Create the run-time directory for the application's HTML, JS and CSS resources

cd ~/ewd3/www
mkdir example-socket-app

# Copy in the HTML and CSS resources from the ewd-xpress-react module

cp ~/ewd3/node_modules/ewd-xpress-react/example/*.html ~/ewd3/www/example-socket-app
cp ~/ewd3/node_modules/ewd-xpress-react/example/*.css ~/ewd3/www/example-socket-app

# Copy the back-end module to the node_modules directory

cp ~/ewd3/node_modules/ewd-xpress-react/example/node_modules/example-socket-app.js ~/ewd3/node_modules

echo 'Done!'

# Now you can compile an application bundle for this app:
#  cd ~/ewd3/node_modules/ewd-xpress-react/example
#  browserify -t [ babelify --compact false --presets [es2015 react] ] app.js | uglifyjs > bundle.js
#  cp ~/ewd3/node_modules/ewd-xpress-react/example/bundle.js ~/ewd3/www/example-socket-app

# Run it using http://192.168.1.100:8080/example-socket-app/index.html

