# TODO OTHER STUFF

- [ ] grab combined-09 from here http://factory-firmware-binaries.particle.io instead of including it inline

# TODO STUFF FROM OLD RIG
Joe, see https://mail.google.com/mail/#inbox/150f8a65d96d5cde for original bash script
- [ ] autossh configuration
- [ ] enable random number generator

    echo "Enabling hardware random number generator"
    sudo rpi-update
    sudo modprobe bcm2708-rng
    echo "add bcm2708-rng to /etc/modules"
    sync # Force changed blocks to disk, update the super block

- [ ] Confirm node.js version is good on RPi

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

# HAD COMPLETED
- gcc >= 4.9.2
- libusb

# COMPLETED

- [x] install autossh
- [x] misc packages sudo apt-get install git dh-autoreconf htop minicom
  - [x] git
  - [SKIP] dh-autoreconf, why?
  - [x] htop
  - [x] minicom
- [SKIP] set the local time to CST, let's stick to utc
- [x] Install dfu-util

