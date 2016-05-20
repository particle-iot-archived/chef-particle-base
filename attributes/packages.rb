###
# What packages does it install?
# These defaults are opinions, provided a package is not huge, installs cleanly on >= RPi2 Debian 8.2 and friends, issue a PR and we'll probably merge it
###
default['particle-base']['do_update_packages'] = true

# COMMON PACKAGES
default['particle-base']['packages']['essentials'] = %w(git)
default['particle-base']['packages']['terminal-multiplexers'] = %w(tmux)
default['particle-base']['packages']['dfu-util'] = if platform_family?('mac_os_x')
  %w(pkg-config libusb dfu-util)
else
  %w(pkg-config libusb-1.0-0 dfu-util)
end
# From http://czmq.zeromq.org/page:get-the-software, "you will need build-essentials, libtool, autoconf, automake and uuid-dev or equivalent."
# todo: look into
default['particle-base']['packages']['zmq-build'] = if platform_family?('mac_os_x')
  %w(libtool)
else
  %w(software-properties-common)
end
# Debian only packages
default['particle-base']['debian_packages']['essentials'] = %w(ca-certificates ntpdate)
default['particle-base']['debian_packages']['editors'] = %w(vim nano)
default['particle-base']['debian_packages']['linux-admin'] = %w(htop tree)
