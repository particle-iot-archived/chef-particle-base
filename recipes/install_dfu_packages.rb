case node['platform_family']
when 'debian' # includes ubuntu
  package node['particle_base']['packages']['debian']['dfu']
when 'mac_os_x'
  package node['particle_base']['packages']['mac_os_x']['dfu']
else
  log "Cannot install dfu packages for platform_family=#{node['platform_family']}" do
    level :error
  end
end
