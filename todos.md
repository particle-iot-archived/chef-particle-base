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
  http://www.ideaheap.com/2013/07/stopping-sd-card-corruption-on-a-raspberry-pi/

        sudo dphys-swapfile swapoff
        sudo dphys-swapfile uninstall
        sudo update-rc.d dphys-swapfile remove

### From CI related ideas/Joe stuff

- [ ] install particle-cli; configure 3 directories for 3 different clouds so we can concurrently use the cli to run tests against different clouds for the same userx
- [ ] grab combined-09 from here http://factory-firmware-binaries.particle.io instead of including it inline
- [ ] make a script that does this to reset a photon to exact factory state.

BOOOM; this works:

    openocd -f "$PARTICLE_CFG_PATH" -f "$STM32F2X_CFG_PATH" \
      -c "init" \
      -c "reset init" \
      -c "flash protect 0 0 last off" \
      -c "flash erase_sector 0 0 last" \
      -c "flash write_image /root/.chef/cookbooks/particle-programmer-shield/files/default/official_binaries/combined_BM-09.bin 0x08000000" \
      -c "flash fillh 0x08005D88 0xAAAA 1" \
      -c "flash fillh 0x08009D88 0xAAAA 1" \
      -c "reset run" \
      -c "shutdown"

pocd \
  -c "init" \
  -c "reset init" \
  -c "flash protect 0 0 last off" \
  -c "flash erase_sector 0 0 last" \
  -c "flash write_image /root/.chef/cookbooks/particle-programmer-shield/files/default/official_binaries/combined_BM-09.bin" \
  -c "flash fillh 0x08005D88 0xAAAA 1" \
  -c "flash fillh 0x08009D88 0xAAAA 1" \
  -c "reset run" \
  -c "shutdown"


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
