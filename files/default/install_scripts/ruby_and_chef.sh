#!/bin/bash
# Static, potentialy out of date script used for initial Raspberry Pi 2 B+ config
# inspired from here http://everydaytinker.com/raspberry-pi/installing-chef-client-on-a-raspberry-pi-2-model-b/ with a few slight tweaks
cd /root
apt-get update
apt-get purge ruby1.9 -y
apt-get install build-essential libyaml-dev libssl-dev libreadline-dev
wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
tar -xvzf ruby-2.2.2.tar.gz
cd ruby-2.2.2
./configure --enable-shared --disable-install-doc --disable-install-rdoc --disable-install-capi
make install
echo "gem: --no-document" >> ~/.gemrc
gem install chef --no-ri --no-rdoc --version 12.5.1
gem install bundler --no-ri --no-rdoc
gem install berkshelf --no-ri --no-rdoc
