###
# Installs particle-cli via a pre-cooked binary package Julien created
###

# Download the installer
#
remote_file node['particle_base']['particle-cli-installer']['download_path'] do
  source node['particle_base']['particle-cli-installer']['source_url']
end

if platform_family?('windows')
  log "Not unzipping, expecting an .exe"
else
  execute "change particle-cli-ng permissions" do
    command "chmod 755 #{node['particle_base']['particle-cli-installer']['executable_path']}"
    action :nothing
  end
  execute 'gunzip particle-cli-ng installer' do
    command "gunzip #{node['particle_base']['particle-cli-installer']['download_path']}"
    cwd node['particle_base']['particle-cli-installer']['working_dir']
    not_if { File.exists?(node['particle_base']['particle-cli-installer']['executable_path']) }
    notifies :run, "execute[change particle-cli-ng permissions]", :immediately
  end
end
execute 'install particle-cli from particle-cli-ng' do
  environment({"HOME" => node['particle_base']['user_home_dir']})
  command "./#{node['particle_base']['particle-cli-installer']['executable_name']}"
  cwd node['particle_base']['particle-cli-installer']['working_dir']
  returns [0,1]
  only_if { File.exists?(node['particle_base']['particle-cli-installer']['executable_path']) } # TODO: make this not run if particle is already installedkkkj?
end

# TODO: /Users/particle-ci/.particle/node-v5.4.1-darwin-x64 needs to be loaded into the path from the installer
link "/usr/local/bin/particle" do
  to "#{node['particle_base']['user_home_dir']}/.particle/node_modules/particle-cli/bin/particle.js"
end
