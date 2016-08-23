case node['platform_family']
when 'debian' # includes ubuntu
  package node['particle_base']['packages']['debian']['zmq']
when 'mac_os_x'
  package node['particle_base']['packages']['mac_os_x']['zmq']
else
  log "Cannot install zmq packages for platform_family=#{node['platform_family']}" do
    level :error
  end
end
