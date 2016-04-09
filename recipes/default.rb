if node['particle-base']['do_update_packages']
  if platform_family?('debian')
    execute "apt-get update"
  elsif platform_family?('mac_os_x')
    # execute "brew update" # this fails with Error: Cowardly refusing to 'sudo brew update'
    # user is expected to run `brew update` before converging
    log "Did you run `brew update`? Highly recommended."
  end
end

directory node['particle-base']['user_home_dir'] do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end
user node['particle-base']['user'] do
  home node['particle-base']['user_home_dir']
  group node['particle-base']['group']
  # supports :manage_home => true
end

# install gcc
node.override['build-essential']['compile_time'] = true
include_recipe 'build-essential'


# create a place where generated executable scripts go
directory "#{node['particle-base']['dir']}/bin" do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end

# Render a script to update cookbooks and update the running system
template node['particle-base']['scripts']['update_cookbook_and_converge'] do
  source 'update-and-converge.sh.erb'
end


# Install common packages
node['particle-base']['packages'].each_pair do |category, pkg_array|
  Chef::Log.debug "installing #{category} packages: #{pkg_array}"
  pkg_array.each do |pkg_name|
    Chef::Log.debug "installing #{pkg_name}"
    package pkg_name
  end
end

# Install OS specific packages
if platform_family?('debian')
  node['particle-base']['debian_packages'].each_pair do |category, pkg_array|
    Chef::Log.debug "installing debian specific package #{category} packages: #{pkg_array}"
    pkg_array.each do |pkg_name|
      Chef::Log.debug "installing #{pkg_name}"
      package pkg_name
    end
  end
end

# create dir for tmp crap to go
directory node['particle-base']['tmp_dir'] do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end

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
  only_if { File.exists?(node['particle-base']['particle-cli-installer']['executable_path']) } # TODO: make this not run if particle is already installed?
end
link "/usr/local/bin/particle" do
  to "#{node['particle-base']['user_home_dir']}/.particle/node_modules/particle-cli/bin/particle.js"
end
