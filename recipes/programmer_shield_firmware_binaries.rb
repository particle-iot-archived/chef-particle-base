directory node['particle']['programmer_shield']['official_binaries'] do
  recursive true
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# The factory default binary was not initially released on public github
cookbook_file "#{node['particle']['programmer_shield']['official_binaries']}/combined_BM-09.bin" do
  source "official_binaries/combined_BM-09.bin"
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end
