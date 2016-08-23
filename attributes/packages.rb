# packages that should live EVERY WHERE; no packages that launch services allowed in this list; that should happen elsewhere
default['particle_base']['packages']['debian']['every_node'] = %w(ca-certificates git htop tmux vim nano netcat jq)
default['particle_base']['packages']['mac_os_x']['every_node'] = %w(git vim tmux nano netcat jq)


# dfu packages for different OSes
default['particle_base']['packages']['debian']['dfu'] = %w(pkg-config libusb-1.0-0 dfu-util)
default['particle_base']['packages']['mac_os_x']['dfu'] = %w(pkg-config libusb dfu-util)

# zmq packages
# See http://czmq.zeromq.org/page:get-the-software for the latest instructions
default['particle_base']['packages']['debian']['zmq'] = %w(software-properties-common)
default['particle_base']['packages']['mac_os_x']['zmq'] = %w(libtool)
