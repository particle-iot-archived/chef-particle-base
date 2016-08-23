# Create a place where generated executable scripts go
directory "#{node['particle_base']['dir']}/bin" do
  recursive true
end

# Create dir for tmp crap to go
directory node['particle_base']['tmp_dir'] do
  recursive true
end

# Render a script to update cookbooks and update the running system
template node['particle_base']['scripts']['update_cookbook_and_converge'] do
  source 'update-and-converge.sh.erb'
end
