#!/bin/bash
set -e
# This script installs modern Ruby, Chef, and git clones the cookbook to the machine and runs it.
#
# Usage
# ====
#
#   curl -sSL https://raw.githubusercontent.com/spark/chef-particle-base/master/bootstrap.bash | sudo bash

main() {
  if is_osx; then
    echo 'Detected osx'
    install_on_osx
  elif is_rpi; then
    echo 'Detected Raspberry Pi'
    install_on_rpi
  else
    echo "OS not supported by bootstrap script"
    exit 1
  fi
}

###
# OS X FUNCTIONS
##
is_osx() {
  [[ `uname | grep -i darwin` ]]
}
install_on_osx() {
  echo 'installing ruby + chef via ChefDK'
  export OSX_VERSION="10.11"
  export DMG_FILE="chefdk-0.12.0-1.dmg"
  export BUILD_DIR=/opt/particle-base/bootstrap/tmp
  _make_and_cd_to_build_dir
  _idempotently_get_chefdk_dmg
  _install_dmg
  git_clone_particle_base
  run_chef_client
}
_make_and_cd_to_build_dir() {
  mkdir -p $BUILD_DIR
  cd $BUILD_DIR
}
_idempotently_get_chefdk_dmg() {
  if [[ -e "$DMG_FILE" ]]; then
    echo "$DMG_FILE exists, not re-downloading"
  else
    wget "https://packages.chef.io/stable/mac_os_x/${OSX_VERSION}/${DMG_FILE}"
  fi
}
_install_dmg() {
  open $DMG_FILE
  echo "Click your way through the installer yo."
}


###
# RPI FUNCTIONS
##
is_rpi() {
  [[ `lsb_release -si | grep 'debian|Raspbian'` ]]
}
install_on_rpi() {
  echo 'Building ruby from source and installing chef via rubygems'
  export BUILD_DIR=rig-bootstrap-tmp
  dist_version="$(cat /etc/debian_version | sed 's/\/.*//' | sed 's/\..*//')"
  case "$dist_version" in
    8)
      dist_version="jessie"
    ;;
    7)
      dist_version="wheezy"
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

  git_clone_particle_base
  run_chef_client
}


###
# COMMON FUNCTIONS
###
git_clone_particle_base() {
  mkdir -p ~/.chef/cookbooks
  git clone https://github.com/spark/chef-particle-base.git ~/.chef/cookbooks/particle-base
}
run_chef_client() {
  cd ~/.chef
  chef-client --local --override-runlist 'recipe[particle-base]'
}
main
