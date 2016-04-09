user node['particle-base']['user'] do
  home node['particle-base']['user_home_dir']
  group node['particle-base']['group']
  # supports :manage_home => true
end
directory node['particle-base']['user_home_dir'] do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end

