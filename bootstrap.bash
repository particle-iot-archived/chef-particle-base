#!/bin/sh
# ONLY WORKS ON RPI
set -e
# This script installs modern Ruby, Chef, and git clones the cookbook to the machine and runs it.
#
# Usage
# ====

#   curl -sSL https://raw.githubusercontent.com/spark/chef-particle-base/master/bootstrap.bash | sudo bash

export BUILD_DIR=rig-bootstrap-tmp

do_install() {
  # TODO: eventually make this bootstrap work on other platforms
  lsb_dist="$(lsb_release -si)"
  case "$lsb_dist" in
    debian|Raspbian)
      dist_version="$(cat /etc/debian_version | sed 's/\/.*//' | sed 's/\..*//')"
      case "$dist_version" in
        8)
          dist_version="jessie"
        ;;
        7)
          dist_version="wheezy"
        ;;
      esac
    ;;
    *)
      echo "Usage: $lsb_dist not supported by this script, make a GH issue if you want it"
      exit 1
    ;;
  esac
  mkdir -p $BUILD_DIR
  cd $BUILD_DIR
  apt-get update

  # Build and install Ruby
  apt-get purge ruby1.9 -y
  apt-get install build-essential libyaml-dev libssl-dev libreadline-dev -y
  rm -rf ruby-2.2.2.tar.gz # done to make it idempotent
  wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
  tar -xvzf ruby-2.2.2.tar.gz
  cd ruby-2.2.2
  ./configure --enable-shared --disable-install-doc --disable-install-rdoc --disable-install-capi
  make install

  # Install gems
  echo "gem: --no-document" >> ~/.gemrc
  gem install chef --no-ri --no-rdoc --version 12.8.1
  gem install bundler --no-ri --no-rdoc

  # Run chef-client
  mkdir -p ~/.chef/cookbooks
  git clone https://github.com/spark/chef-particle-base.git ~/.chef/cookbooks/particle-base
  cd ~/.chef
  chef-client --local --override-runlist 'recipe[particle-base]'
}
do_install
