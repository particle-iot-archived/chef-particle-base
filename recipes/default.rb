include_recipe('particle-base::user')
include_recipe('particle-base::packages')
include_recipe 'build-essential'
include_recipe('particle-base::arm_gcc')
include_recipe('particle-base::directories')
include_recipe('particle-base::scripts')

if platform_family?('mac_os_x')
  Chef::Log.error "TODO: INSTALL NVM + NODE 5.4.x (same as cli_ng)"
else
  include_recipe('particle-base::particle_cli_ng')
end
