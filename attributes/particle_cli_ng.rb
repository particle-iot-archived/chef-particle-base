###
# particle_cli_installer
# Install particle-cli from Julien's installer: https://dfu55fst9l042.cloudfront.net/index.html
# The latest installer links as of 8/23/16: https://binaries.particle.io/cli/master/manifest.json
# TODO: UPDATE TO LATEST
###


# Some tools require a home directory to be specified
default['particle_base']['particle_cli_installer']['home_dir'] = '/root'

default['particle_base']['particle_cli_installer']['source_url'] = if platform_family?('mac_os_x')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/darwin/amd64/particle-cli-ng.gz"
elsif platform_family?('debian')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/linux/amd64/particle-cli-ng.gz"
elsif platform_family?('windows')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/windows/amd64/particle-cli-ng.exe"
else
  Chef::Log.error "particle_cli_installer not supported on #{node['platform_family']}"
  "" # return a string;
end
default['particle_base']['particle_cli_installer']['download_path'] = "#{node['particle_base']['directories']['tmp']}/#{File.basename(node['particle_base']['particle_cli_installer']['source_url'])}"
default['particle_base']['particle_cli_installer']['executable_name'] = if platform_family?('windows')
  'particle-cli-ng.exe'
else
  'particle-cli-ng'
end
default['particle_base']['particle_cli_installer']['working_dir'] = File.dirname(node['particle_base']['particle_cli_installer']['download_path'])
default['particle_base']['particle_cli_installer']['executable_path'] = "#{node['particle_base']['particle_cli_installer']['working_dir']}/#{node['particle_base']['particle_cli_installer']['executable_name']}"
