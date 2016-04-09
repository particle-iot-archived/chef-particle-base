###
# particle-cli-installer
# Install particle-cli from Julien's installer: https://dfu55fst9l042.cloudfront.net/index.html
###
default['particle-base']['tmp_dir'] = "#{node['particle-base']['dir']}/tmp"

default['particle-base']['particle-cli-installer']['source_url'] = if platform_family?('mac_os_x')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/darwin/amd64/particle-cli-ng.gz"
elsif platform_family?('debian')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/linux/amd64/particle-cli-ng.gz"
elsif platform_family?('windows')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/windows/amd64/particle-cli-ng.exe"
else
  raise "particle-cli-installer not supported on #{node['platform_family']}"
end
default['particle-base']['particle-cli-installer']['download_path'] = "#{node['particle-base']['tmp_dir']}/#{File.basename(node['particle-base']['particle-cli-installer']['source_url'])}"
default['particle-base']['particle-cli-installer']['executable_name'] = if platform_family?('windows')
  'particle-cli-ng.exe'
else
  'particle-cli-ng'
end
default['particle-base']['particle-cli-installer']['working_dir'] = File.dirname(node['particle-base']['particle-cli-installer']['download_path'])
default['particle-base']['particle-cli-installer']['executable_path'] = "#{node['particle-base']['particle-cli-installer']['working_dir']}/#{node['particle-base']['particle-cli-installer']['executable_name']}"
