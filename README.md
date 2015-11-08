# particle-programmer-shield

A set of scripts to configure a machine to use the [Particle Programmer Shield](https://github.com/spark/shields/tree/master/photon-shields/programmer-shield) for repeatable OpenOCD Particle firmware programming and continuous integration.

Supported Platforms
------------

- Raspberry Pi 2 B+

Bootstrap the Pi with Ruby + Chef
---

Run this [shell script](/files/default/ruby_and_chef.sh) as root.

Grab cookbook and run it
---

    git clone <git-repo>
    cd <git-repo>
