remote_file node['particle']['programmer_shield']['env']['PARTICLE_CFG_PATH'] do
  source node['particle']['programmer_shield']['remote_sources']['PARTICLE_CFG_PATH']
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end
