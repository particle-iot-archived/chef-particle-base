# THESE SNIPPETS WERE USED BEFORE TURNING THEM INTO CHEF TEMPLATES, THEY MIGHT BE OUT OF DATE.

# Static, potentialy out of date script used for initial Raspberry Pi 2 B+ config
# Inspired from docs here:
#   https://github.com/spark/shields/tree/master/photon-shields/programmer-shield
#   http://openocd.org/documentation/
cd /root
apt-get install build-essential make libtool pkg-config autoconf automake texinfo libusb-dev libusb-1.0-0 libusb-1.0-0-dev gdb -y
git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap
./configure --enable-ftdi
make
make install


# Static, potentially out of date script for OS X 10.10
brew update
brew install libusb-compat libusb
git clone -b v0.9.0 git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap
./configure --enable-ftdi
make
make install
