###
# What user do all of the tools get installed with and used by?
###
default['particle-base']['user'] = 'ci'

default['particle-base']['group'] = if platform_family?('mac_os_x')
  "admin"
else
  "ci"
end

default['particle-base']['user_home_dir'] = if platform_family?('mac_os_x')
  "/Users/#{node['particle-base']['user']}"
else
  "/home/#{node['particle-base']['user']}"
end
