#!/bin/bash
# Inspired from docs here:
#   https://github.com/spark/shields/tree/master/photon-shields/programmer-shield
#   http://openocd.org/documentation/
cd /root
apt-get install build-essential make libtool pkg-config autoconf automake texinfo libusb-dev libusb-1.0-0 libusb-1.0-0-dev gdb -y
# TODO: pin version
git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap
./configure --enable-ftdi
make
make install
