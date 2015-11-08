# update packages before doing anything
if node['particle']['do_update_packages']
  if platform_family?('debian')
    execute "apt-get update"
  end
end
# install some base packages like vim + tmux to make ssh sessions more pleasant
node['particle']['packages'].each do |p|
  package p
end

# create a user that we'll execute stuff as
user node['particle']['programmer_shield']['user']

# create a directory where we'll deploy + symlink to a particular version of the programmer-shield project
directory node['particle']['programmer_shield']['deploy_dir'] do
  recursive true
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# create a shared directory where config stuff will go
directory node['particle']['programmer_shield']['shared_dir'] do
  recursive true
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# create a dir where miscellanous build shit can go like ruby tarballs + chef source, etc
directory node['particle']['misc_dir'] do
  recursive true
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# create a .env file that contains all of the key env variables that other scripts use
template "#{node['particle']['programmer_shield']['shared_dir']}/.env" do
  source "dot_env.sh.erb"
end
