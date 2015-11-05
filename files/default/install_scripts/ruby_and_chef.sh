#!/bin/bash
cd /root
apt-get update
apt-get purge ruby1.9 -y
apt-get install build-essential libyaml-dev libssl-dev
# TODO: pin ruby version
wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
tar -xvzf ruby-2.2.2.tar.gz
cd ruby-2.2.2
./configure --enable-shared --disable-install-doc --disable-install-rdoc --disable-install-capi
make install
echo "gem: --no-document" >> ~/.gemrc
# TODO: pin chef version
gem install chef --no-ri --no-rdoc
