default['particle_base']['dir'] = '/opt/particle-base'
default['particle_base']['tmp_dir'] = "#{node['particle_base']['dir']}/tmp"
default['particle_base']['scripts']['update_cookbook_and_converge'] = "#{node['particle_base']['dir']}/bin/update-and-converge"
default['particle_base']['user_home_dir'] = '/root'
