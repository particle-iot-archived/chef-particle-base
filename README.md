# particle-programmer-shield

Installs and configures software for [Openocd](http://openocd.org/) and JTAG programming on a Particle Device. Designed to work with the [Particle Programmer Shield](https://github.com/spark/shields/tree/master/photon-shields/programmer-shield).

It:

- installs OpenOCD and package dependencies
- installs helper scripts + aliases to make use of openocd + jtag simpler
- downloads factory firmware binaries
- installs modern Node.js, Ruby, and Chef
- [NOT YET] installs the particle-cli
- [NOT YET] installs ST-LINK tools
- [NOT YET] installs gcc-arm compiler tools

Supported Platforms
------------

Tested on [Raspbian Jessie OS](https://www.raspberrypi.org/downloads/raspbian/) on Raspberry Pi 1 B+ and Raspberry Pi 2 B. The table below shows other platforms we'd like to support.


```
|-------------------------------+------------|
| OS Name                       | verified?  |
|-------------------------------+------------|
| Raspbian Jessie (8.2)         |     Y      |
|-------------------------------+------------|
| Raspbian Wheezy (8.1)         |     N      |
|-------------------------------+------------|
| OS X (10.10)                  |     N      |
|-------------------------------+------------|
| Ubuntu (14.04)                |     N      |
|-------------------------------+------------|
| Windows (10)                  |     N      |
|-------------------------------+------------|
```

Install Guides
---

- For [RPi + OSX](/doc/install-on-rpi-with-osx.md)

Then:

### Install Chef Cookbook dependencies

    sudo bash
    mkdir -p ~/.chef/cookbooks
    git clone git@github.com:spark/particle-programmer-shield.git ~/.chef/cookbooks/particle-programmer-shield
    cd ~/.chef
    bash cookbooks/particle-programmer-shield/files/default/install_scripts/ruby_and_chef.sh

### Install OpenOCD

    sudo bash
    cd ~/.chef
    chef-client --local --override-runlist 'recipe[particle-programmer-shield]'

Usage
---

In addition to downloading, building, installing, and configuring software, it creates a comfy place to do jtag programming with some programmer shield connected devices.

Creates dir structure like this on the device connected to the programmer-shield:

    /opt/particle/
      bin/
        ..symlinks to any executable contained in other bundled software...
      firmware-binaries/
        comined-bm-09.bin
      embedded
        apps
          pocd/
          bin/
            ...helper openocd scripts...


### Plugin Programmer Shield AND Photon to shield + RPi
### Flash Photon RC4 to connected device


