case node['platform_family']
when 'debian' # includes ubuntu
  package node['particle_base']['packages']['debian']['every_node']
when 'mac_os_x'
  package node['particle_base']['packages']['mac_os_x']['every_node']
when 'rhel'
  package node['particle_base']['packages']['rhel']['every_node']
else
  log "Cannot update package index for platform_family=#{node['platform_family']}" do
    level :error
  end
end
