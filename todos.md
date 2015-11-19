# TODOS

### From old programmer rig/David's shell script

- [ ] configure autossh
- [ ] enable random number generator

    echo "Enabling hardware random number generator"
    sudo rpi-update
    sudo modprobe bcm2708-rng
    echo "add bcm2708-rng to /etc/modules"
    sync # Force changed blocks to disk, update the super block


- [ ] Install ST-LINK tools

    cd ~/tmp
    git clone https://github.com/texane/stlink.git
    cd stlink
    ./autogen.sh
    ./configure
    make
    make install

- [ ] Create a private key for sparkbot3 so it can get private repos???
  - TODO; think about this, how to handle ssh keys + private repos here
  - Note was "Add our public key to our read-only github user: "david+sparkbot@sparkdevices.com""

- [ ] Turn off physical disk swapping

    #http://www.ideaheap.com/2013/07/stopping-sd-card-corruption-on-a-raspberry-pi/
    #turn off physical disk swapping
    sudo dphys-swapfile swapoff
    sudo dphys-swapfile uninstall
    sudo update-rc.d dphys-swapfile remove

### From CI related ideas/Joe stuff

- [ ] grab combined-09 from here http://factory-firmware-binaries.particle.io instead of including it inline

# COMPLETED

- [x] gcc >= 4.9.2
- [x] libusb and friends
- [x] install autossh
- [x] misc packages sudo apt-get install git dh-autoreconf htop minicom
  - [x] git
  - [SKIP] dh-autoreconf, why?
  - [x] htop
  - [x] minicom
- [SKIP] set the local time to CST, let's stick to utc
- [x] Install dfu-util
- [x] Confirm node.js version is good on RPi
