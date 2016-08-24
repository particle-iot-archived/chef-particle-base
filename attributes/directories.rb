# Most directories are relative to this
default['particle_base']['dir'] = '/opt/particle-base'

# for handy bash wrapper scripts, for tools that install via curl/wget; you can use remote_file to render the file into here, then execute it
default['particle_base']['directories']['bin'] = "#{node['particle_base']['dir']}/bin"

# for tmp files that should NOT be managed by the OS's tmp folder
default['particle_base']['directories']['tmp'] = "#{node['particle_base']['dir']}/tmp"
