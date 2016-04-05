# particle-base

Installs/Configures useful tools for programming, testing, and interacting with Particle Devices (https://www.particle.io).

Goals
---

- [x] Provide a useful base for doing continuous integration against Particle Delivery on distributed RPis.

- [ ] Install a known to work version of particle-cli for target OS

- [ ] Install programming tools like openocd + stlink with helper scripts for particle devices

Supported Tools
---

- [x] Modern Chef + Ruby
- [x] OpenOCD
- [ ] Particle-cli
  - Use https://github.com/monkbroc/particle-cli-ng as source of truth
- [ ] ST-LINK tools
- [ ] Installs modern Node.js
- [ ] OpenOCD Helper Scripts: bash scripts to using openocd with Particle devicies easier
- [ ] installs gcc-arm compiler tools

Supported Platforms
------------

- [x] Raspberry Pi: [Raspbian Jessie](https://www.raspberrypi.org/downloads/raspbian/)
- [x] Debian 8.2 (Non-RPi equivalent of Raspbian Jessie)
- [ ] OS X 10.11
- [ ] Ubuntu 14.04
- [ ] Windows 10

Install from OS image Distro
---

These guides describe how to configure a machine from a binary OS image distribution into something that can run this cookbook to take it the rest of the way.

- [x] [RPi](/doc/install-on-rpi-with-osx.md)
- [ ] OS X
- [ ] Windows
- [ ] Ubuntu

Run it the first time
---

    curl -sSL https://raw.githubusercontent.com/spark/particle-base/master/bootstrap.bash | sudo bash

This will git clone this repo to the machine, build, and install modern Ruby and Chef.

Update the cookbook and Particle tools to latest
---

    sudo bash /opt/particle-base/bin/update-and-converge

Contribute
---

Standard GitHub flow style: Discuss via GH Issues, PR with passing tests, Merging, and all that.

Development is done with ChefDK:

- Run linter `chef exec foodcritic .`
- Run unit tests `chef exec rspec`
- Run integration tests `kitchen verify` (todo; set up something using inspec)
