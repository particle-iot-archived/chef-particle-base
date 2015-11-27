# TODOS


### From CI related ideas/Joe stuff

- [WIP] install particle-cli; configure 3 directories for 3 different clouds so we can concurrently use the cli to run tests against different clouds for the same userx
  - particle-cli doesnt install, figure out

        root@raspberrypi:~# npm install particle-cli
        \
        > serialport@2.0.5 install /root/node_modules/particle-cli/node_modules/serialport
        > node-pre-gyp install --fallback-to-build

        sh: 1: node-pre-gyp: Permission denied
        npm ERR! Linux 4.1.7-v7+
        npm ERR! argv "/usr/local/bin/node" "/usr/local/bin/npm" "install" "particle-cli"
        npm ERR! node v4.2.1
        npm ERR! npm  v2.14.7
        npm ERR! file sh
        npm ERR! code ELIFECYCLE
        npm ERR! errno ENOENT
        npm ERR! syscall spawn

        npm ERR! serialport@2.0.5 install: `node-pre-gyp install --fallback-to-build`
        npm ERR! spawn ENOENT
        npm ERR!
        npm ERR! Failed at the serialport@2.0.5 install script 'node-pre-gyp install --fallback-to-build'.
        npm ERR! This is most likely a problem with the serialport package,
        npm ERR! not with npm itself.
        npm ERR! Tell the author that this fails on your system:
        npm ERR!     node-pre-gyp install --fallback-to-build
        npm ERR! You can get their info via:
        npm ERR!     npm owner ls serialport
        npm ERR! There is likely additional logging output above.

        npm ERR! Please include the following file with any support request:
        npm ERR!     /root/npm-debug.log
        root@raspberrypi:~# particle
        -bash: particle: command not found


  - [ ] Switch to use Serial Port npm module recommended
  node version??? https://github.com/voodootikigod/node-serialport

         wget https://node-arm.herokuapp.com/node_archive_armhf.deb
         sudo dpkg -i node_archive_armhf.deb

### From old programmer rig/David's shell script

- [ ] configure autossh

  - See this for reference https://github.com/spark/programming-rig/blob/b64b555266e2640796dda5ac9b1b2d38efcdf39a/software/scripts/startup/sshproxy.sh

## THIS WORKS

### From Raspberry Pi establish persistent tunnel with servier 192.168.1.89

    autossh -M 20000 -R 192.168.1.89:30000:127.0.0.1:22 goggins@192.168.1.89

- However, this maintains a session; will need tweaks to run in background,

- This looks better, doesn't use the monitoring port

    # http://linuxaria.com/howto/permanent-ssh-tunnels-with-autossh
    autossh -c 'autossh -M 0 -q -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -L 3306:localhost:3306 autossh@remotemachine'

### From server, connect to raspberry pi on port 3000

#### SSH

    ssh pi@localhost -p 30000

#### Converge Chef via autossh from server

    ssh pi@localhost -p 30000 sudo bash -c "cd /root/.chef && chef-client --local --override-runlist 'recipe[particle-programmer-shield]'"

#### scp (copy a file from server to PI)

    scp -P 30000 README.md pi@localhost:POO

#### scp (copy a file from PI to server)

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

- [x] grab combined-09 from here http://factory-firmware-binaries.particle.io instead of including it inline
- [x] make a script that does this to reset a photon to exact factory state.

    BINARY_PATH=combined_BM-09.bin pocd-flash-factory-firmware

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

