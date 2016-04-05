###
# Where does everything go?
###
default['particle-base']['dir'] = '/opt/particle-base'

###
# What packages does it install?
# These defaults are opinions, provided a package is not huge, installs cleanly on >= RPi2 Debian 8.2 and friends, issue a PR and we'll probably merge it
###
default['particle-base']['do_update_packages'] = true
default['particle-base']['packages']['essentials'] = %w(git ca-certificates ntpdate)
default['particle-base']['packages']['terminal-multiplexers'] = %w(tmux screen)
default['particle-base']['packages']['editors'] = %w(vim nano)
default['particle-base']['packages']['linux-admin'] = %w(htop tree)
default['particle-base']['packages']['zmq-build'] = %w(libtool libtool-bin)

###
# What user do all of the tools get installed with and used by?
###
default['particle-base']['user'] = 'root'
default['particle-base']['group'] = 'root'
