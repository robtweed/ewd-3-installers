# ewd-3-installers: Pre-built automated installers for creating working EWD 3 systems
 
This repository contains installers for creating ready-to-run EWD 3 systems.  They are ideal for anyone
new to EWD 3 and Cache or GT.M who wants to quickly discover how it works etc.  They are also a great way to quickly get a
working system up and running that you can then adapt and customise.

The installers are for use with Linux systems, virtual machines or Amazon EC2 instances.

Use them as a starting point and guide for creating customised systems and/or for installing EWD 3 on systems that already 
include Node.js, Cache or GT.M

Rob Tweed <rtweed@mgateway.com>  
10 May 2016, M/Gateway Developments Ltd [http://www.mgateway.com](http://www.mgateway.com)  

Twitter: @rtweed

Google Group for discussions, support, advice etc: [http://groups.google.co.uk/group/enterprise-web-developer-community](http://groups.google.co.uk/group/enterprise-web-developer-community)

## Using the Installers

### Installing ewd-xpress with the GT.M Database

On a Ubuntu system:

     cd ~
     sudo apt-get -y install git
     git clone https://github.com/robtweed/ewd-3-installers
     source ewd-3-installers/ewd-xpress/install_gtm.sh

### Installing ewd-xpress with the GlobalsDB Database

On a Ubuntu system:

     cd ~
     sudo apt-get -y install git
     git clone https://github.com/robtweed/ewd-3-installers
     source ewd-3-installers/ewd-xpress/install_globalsdb.sh

### Installing ewd-xpress with the Cache Database

The install script at https://github.com/robtweed/ewd-3-installers/ewd-xpress/install_globalsdb.sh
 is not intended to be run as a script, but more as a template set of instructions that you should
 use as a baseline and adapt, as appropriate, for your particular system.


### Installing ewd-xpress, Redis and ewd-redis-globals on a Raspberry Pi

The installer assumes you've done a fresh installation of NOOBS/Raspbian.  Then:

     cd ~
     wget https://raw.githubusercontent.com/robtweed/ewd-3-installers/master/ewd-xpress/install_rpi.sh
     source install_rpi.sh

Be patient - it all takes quite a while to install, but it should get there in the end.  Then fire up
ewd-xpress using

     cd ~/ewd3
     node ewd-xpress

It will be listening on port 8080, so, to try out ewd-xpress-monitor, use the URL:

     http://192.168.1.230:8080/ewd-xpress-monitor/index.html

     (change the IP address to that assigned to your Raspberry Pi)

When prompted for a password, enter:

     keepThisSecret!

You can change the password by editing the startup file: ~/ewd3/ewd-xpress.js



## License

 Copyright (c) 2016 M/Gateway Developments Ltd,                           
 Reigate, Surrey UK.                                                      
 All rights reserved.                                                     
                                                                           
  http://www.mgateway.com                                                  
  Email: rtweed@mgateway.com                                               
                                                                           
                                                                           
  Licensed under the Apache License, Version 2.0 (the "License");          
  you may not use this file except in compliance with the License.         
  You may obtain a copy of the License at                                  
                                                                           
      http://www.apache.org/licenses/LICENSE-2.0                           
                                                                           
  Unless required by applicable law or agreed to in writing, software      
  distributed under the License is distributed on an "AS IS" BASIS,        
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
  See the License for the specific language governing permissions and      
   limitations under the License.      
