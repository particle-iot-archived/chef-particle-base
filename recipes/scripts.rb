# Render a script to update cookbooks and update the running system
template node['particle-base']['scripts']['update_cookbook_and_converge'] do
  source 'update-and-converge.sh.erb'
end
