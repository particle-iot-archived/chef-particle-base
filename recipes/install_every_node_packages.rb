case node['platform_family']
when 'debian' # includes ubuntu
  node['particle_base']['packages']['debian']['every_node'].each do |p|
    package p
  end
when 'mac_os_x'
  node['particle_base']['packages']['mac_os_x']['every_node'].each do |p|
    package p
  end
when 'rhel'
  node['particle_base']['packages']['rhel']['every_node'].each do |p|
    package p
  end
else
  log "Cannot update package index for platform_family=#{node['platform_family']}" do
    level :error
  end
end
