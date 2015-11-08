# particle-programmer-shield

A set of scripts to configure a machine to use the [Particle Programmer Shield](https://github.com/spark/shields/tree/master/photon-shields/programmer-shield) for repeatable OpenOCD Particle firmware programming and continuous integration.

Supported Platforms
------------

- Raspberry Pi 2 B+

Usage
---

### 1. Bootstrap the Pi with Ruby + Chef

Run this [shell script](/files/default/ruby_and_chef.sh) as root.

### 2. Install the goodies

Run this as root:

    mkdir -p ~/.chef/cookbooks
    git clone git@github.com:spark/particle-programmer-shield.git ~/.chef/cookbooks/particle-programmer-shield
    cd .chef
    chef-client --local --override-runlist 'recipe[particle-programmer-shield]'

This does the following:

- installs openocd
- grabs a git clone of the programmer-shield repo
- symlinks config files to make shell usage more friendly
