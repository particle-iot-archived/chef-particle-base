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

Then on the RPi:

    curl -sSL https://raw.githubusercontent.com/spark/particle-programmer-shield/master/bootstrap.bash | sudo bash

- This will take a LONG time (1-3 hours), it first builds and installs modern Ruby and Chef via then runs `chef-client` to configure the RPi image
with handy tools.

After bootstrap, update config later
---

    sudo bash
    (cd ~/.chef/cookbooks/particle-programmer-shield && git pull)
    cd ~/.chef
    chef-client --local --override-runlist 'recipe[particle-programmer-shield]'

Usage
---

TODO: Document things you can do with this...
