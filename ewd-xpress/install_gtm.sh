#!/usr/bin/env bash

# run using: source install_gtm_2.sh

# Acknowledgement: Wladimir Mutel for NodeM configuration logic
#                  KS Bhaskar for GT.M installation logic

# run as normal user, eg ubuntu


# Prepare

echo 'Preparing environment'

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y wget gzip openssh-server curl

# GT.M

echo 'Installing GT.M'

mkdir /tmp/tmp # Create a temporary directory for the installer
cd /tmp/tmp    # and change to it. Next command is to download the GT.M installer
wget https://sourceforge.net/projects/fis-gtm/files/GT.M%20Installer/v0.13/gtminstall
chmod +x gtminstall # Make the file executable
sudo -E ./gtminstall --utf8 default --verbose # download and install GT.M including UTF-8 mode

echo 'Configuring GT.M'

source "/usr/lib/fis-gtm/V6.3-000_x86_64"/gtmprofile
echo 'source "/usr/lib/fis-gtm/V6.3-000_x86_64"/gtmprofile' >> ~/.profile

# Node.js

echo 'Installing Node.js'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm alias default 4.4
nvm install 4.4
nvm use default
echo 'nvm use default' >> ~/.profile

sudo ln -s /usr/local/bin/node /usr/bin/node
sudo ln -s /usr/local/lib/node /usr/lib/node
sudo ln -s /usr/local/bin/npm /usr/bin/npm
sudo ln -s /usr/local/bin/node-waf /usr/bin/node-waf
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

# ewd-xpress

echo 'Installing ewd-qoper8 and associated modules'

cd ~
mkdir ewd3
cd ewd3
npm install ewd-xpress ewd-xpress-monitor

# NodeM

echo 'Installing NodeM'

npm install nodem
sudo ln -sf $gtm_dist/libgtmshr.so /usr/local/lib/
sudo ldconfig
base=~/ewd3
[ -f "$GTMCI" ] || export GTMCI="$(find $base -iname nodem.ci)"
nodemgtmr="$(find $base -iname v4wnode.m | tail -n1 | xargs dirname)"
echo "$gtmroutines" | fgrep "$nodemgtmr" || export gtmroutines="$nodemgtmr $gtmroutines"

echo 'base=~/ewd3'
echo '[ -f "$GTMCI" ] || export GTMCI="$(find $base -iname nodem.ci)"' >> ~/.profile
echo 'nodemgtmr="$(find $base -iname v4wnode.m | tail -n1 | xargs dirname)"' >> ~/.profile
echo 'echo "$gtmroutines" | fgrep "$nodemgtmr" || export gtmroutines="$nodemgtmr $gtmroutines"' >> ~/.profile

# ewd-express

echo 'Moving ewd-express files into place'

mv ~/ewd3/node_modules/ewd-xpress/example/ewd-xpress-gtm.js ~/ewd3/ewd-xpress.js

cd ~/ewd3
mkdir www
cd www
mkdir ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/bundle.js ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.html ~/ewd3/www/ewd-xpress-monitor
cp ~/ewd3/node_modules/ewd-xpress-monitor/www/*.css ~/ewd3/www/ewd-xpress-monitor

cd ~/ewd3

echo 'Done!'

