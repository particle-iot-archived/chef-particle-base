# Download the installer
remote_file node['particle-base']['particle-cli-installer']['download_path'] do
  source node['particle-base']['particle-cli-installer']['source_url']
end

if platform_family?('windows')
  log "Not unzipping, expecting an .exe"
else
  execute "change particle-cli-ng permissions" do
    command "chmod 755 #{node['particle-base']['particle-cli-installer']['executable_path']}"
    action :nothing
  end
  execute 'gunzip particle-cli-ng installer' do
    command "gunzip #{node['particle-base']['particle-cli-installer']['download_path']}"
    cwd node['particle-base']['particle-cli-installer']['working_dir']
    not_if { File.exists?(node['particle-base']['particle-cli-installer']['executable_path']) }
    notifies :run, "execute[change particle-cli-ng permissions]", :immediately
  end
end
execute 'install particle-cli from particle-cli-ng' do
  environment({"HOME" => node['particle-base']['user_home_dir']})
  user node['particle-base']['user']
  group node['particle-base']['group']
  command "./#{node['particle-base']['particle-cli-installer']['executable_name']}"
  cwd node['particle-base']['particle-cli-installer']['working_dir']
  returns [0,1]
  only_if { File.exists?(node['particle-base']['particle-cli-installer']['executable_path']) } # TODO: make this not run if particle is already installedkkkj?
end
link "/usr/local/bin/particle" do
  to "#{node['particle-base']['user_home_dir']}/.particle/node_modules/particle-cli/bin/particle.js"
end
