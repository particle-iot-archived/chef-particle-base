include_recipe('particle_base::create_directories')
# Render a script to update cookbooks and update the running system
template node['particle_base']['scripts']['update_cookbook_and_converge'] do
  source 'update-and-converge.sh.erb'
end
