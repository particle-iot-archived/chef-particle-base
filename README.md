# particle-programmer-shield

A set of scripts to configure a machine to use the [Particle Programmer Shield](https://github.com/spark/shields/tree/master/photon-shields/programmer-shield) for repeatable OpenOCD Particle firmware programming and continuous integration.

Supported Platforms
------------

- Raspberry Pi 2 B+

Usage
---

### 0. Write the SD card

- `df -h`: see something like 

/dev/disk2s1
disk2s1

https://www.raspberrypi.org/documentation/installation/installing-images/mac.md
= `diskutil list`
/dev/disk2

diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=2015-09-24-raspbian-jessie.img of=/dev/rdisk2


sudo dd bs=1m if=2015-09-24-raspbian-jessie.img of=/dev/rdisk2
/dev/disk2
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *16.1 GB    disk2
   1:             Windows_FAT_32 boot                    58.7 MB    disk2s1
   2:                      Linux                         4.3 GB     disk2s2

- ON DEVICE:
- change keyboard layout to english


### berkshelf fails

config.status: creating gecode/support/config.hpp
-> make clean
(cd . && autoconf)
/bin/sh: 1: autoconf: not found
Makefile:1455: recipe for target 'configure' failed
make: *** [configure] Error 127
extconf.rb:98:in `block in run': Failed to build gecode library. (GecodeBuild::BuildError)
        from extconf.rb:97:in `chdir'
        from extconf.rb:97:in `run'
        from extconf.rb:104:in `<main>'

extconf failed, exit code 1

Gem files will remain installed in /usr/local/lib/ruby/gems/2.2.0/gems/dep-selector-libgecode-1.0.2 for inspection.
Results logged to /usr/local/lib/ruby/gems/2.2.0/extensions/armv7l-linux/2.2.0/dep-selector-libgecode-1.0.2/gem_make.out

### Change pi user password
### Enable SSH
### Add root ssh deploy key to needed private

    sudo bash
    ssh-keygen
    cap ~/.ssh/id_rsa.pub
    # go add this somewhere in github

### Bootstrap Pi + Run chef

Run this as root:

    mkdir -p ~/.chef/cookbooks
    git clone git@github.com:spark/particle-programmer-shield.git ~/.chef/cookbooks/particle-programmer-shield
    cd ~/.chef
    bash cookbooks/particle-programmer-shield/files/default/install_scripts/ruby_and_chef.sh
    chef-client --local --override-runlist 'recipe[particle-programmer-shield]'

This does the following:

- installs openocd
- grabs a git clone of the programmer-shield repo
- symlinks config files to make shell usage more friendly
