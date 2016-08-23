# particle_base

Installs/Configures useful command line tools for programming, testing, and interacting with Particle Devices (https://www.particle.io).
By design it's meant to AS MINIMAL AS POSSIBLE so it can serve as a minimal base for other Particle chef cookbooks in a variety of compute contexts.
There are several hard and fast rules of what can go in this cookbook to keep it minimal:

- NO services or daemons
- NO special users (everything happens as root)

Goals
---

- [x] Provide a useful base for doing continuous integration against Particle Delivery on distributed RPis.

- [x] Install a known to work version of particle-cli for target OS

- [ ] Install programming tools like openocd + stlink with helper scripts for particle devices

Supported Tools
---

- [x] Modern Chef + Ruby
- [x] OpenOCD
- [x] Particle-cli
  - Use https://github.com/monkbroc/particle-cli-ng as source of truth
- [x] Installs modern Node.js (in /home/particle-ci/.particle)
- [x] dfu-util
- [x] installs gcc-arm compiler tools
- [ ] OpenOCD Helper Scripts: bash scripts to using openocd with Particle devicies easier
- [ ] ST-LINK tools

Supported Platforms
------------

- [x] Raspberry Pi: [Raspbian Jessie](https://www.raspberrypi.org/downloads/raspbian/)
- [x] Debian 8.2 (Non-RPi equivalent of Raspbian Jessie)
- [x] OS X 10.11
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

    curl -sSL https://raw.githubusercontent.com/spark/chef-particle-base/master/bootstrap.bash | sudo bash

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
