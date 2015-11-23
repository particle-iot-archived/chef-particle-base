# particle-programmer-shield

A set of scripts to configure a machine to use the [Particle Programmer Shield](https://github.com/spark/shields/tree/master/photon-shields/programmer-shield) for repeatable OpenOCD Particle firmware programming and continuous integration.

Supported Platforms
------------

Tested on [Raspbian Jessie OS](https://www.raspberrypi.org/downloads/raspbian/) on Raspberry Pi 1 B+ and Raspberry Pi 2 B.

Setup on an RPi
---

Instructions mostly taken from [here](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md).

### Write the SD card with Debian Jessie (on OS X)

- Download an OS from the above download linke
- Insert the SD card in Mac
- `df -h`: see something like:

        /dev/disk2s1

- `diskutil list`: see something like:

        /dev/disk2
           #:                       TYPE NAME                    SIZE       IDENTIFIER
           0:     FDisk_partition_scheme                        *16.1 GB    disk2
           1:             Windows_FAT_32 boot                    58.7 MB    disk2s1
           2:                      Linux                         4.3 GB     disk2s2

- `diskutil unmountDisk /dev/disk2`;
- `sudo dd bs=1m if=2015-09-24-raspbian-jessie.img of=/dev/rdisk2` to flash it.
  - Note this takes a LONG time (20-50m) with no output
  - Nuance: this did not take advantage of all of the space on the micro sd card.

### Plugin Keyboard/Mouse/monitor + fire up Raspberry Pi

- Point and click around to change keyboard layout to english (otherwise @ is a "), it default to UK
- `passwd` to change `pi` user password (default is `raspberry`), change it to something secure that you'll ssh in with
- `sudo raspi-config` -> Advanced -> SSH -> Enable

### Generate a ssh keypair for root user, that you'll use to snag repos

    sudo bash
    ssh-keygen
    cat ~/.ssh/id_rsa.pub

- go add this somewhere key in github so you'll have access to the private repos that are used in this cookbook/in your project

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

### Plugin Programmer Shield AND Photon to shield + RPi
### Flash Photon RC4 to connected device


