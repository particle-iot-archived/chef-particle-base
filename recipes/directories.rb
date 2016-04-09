# create a place where generated executable scripts go
directory "#{node['particle-base']['dir']}/bin" do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end

# create dir for tmp crap to go
directory node['particle-base']['tmp_dir'] do
  user node['particle-base']['user']
  group node['particle-base']['group']
  recursive true
end
