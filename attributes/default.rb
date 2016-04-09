###
# Where does everything go?
###
default['particle-base']['dir'] = '/opt/particle-base'

###
# What user do all of the tools get installed with and used by?
###
default['particle-base']['user'] = 'particle-ci'
default['particle-base']['group'] = if platform_family?('mac_os_x')
                                      "admin"
                                    else
                                      "particle-ci"
                                    end

default['particle-base']['user_home_dir'] = if platform_family?('mac_os_x')
                                              "/Users/#{node['particle-base']['user']}"
                                            else
                                              "/home/#{node['particle-base']['user']}"
                                            end


###
# How do I update stuff?
###
default['particle-base']['scripts']['update_cookbook_and_converge'] = "#{node['particle-base']['dir']}/bin/update-and-converge"
