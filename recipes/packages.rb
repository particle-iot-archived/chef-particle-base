
if node['particle-base']['do_update_packages']
  if platform_family?('debian')
    execute "apt-get update"
  elsif platform_family?('mac_os_x')
    execute('install homebrew') do
      command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      user node['particle-base']['user'] do
      group node['particle-base']['group']
      not_if "which brew"
    end
    log "Did you run `brew update`? Highly recommended."
  end
end

# Install common packages
node['particle-base']['packages'].each_pair do |category, pkg_array|
  Chef::Log.debug "installing #{category} packages: #{pkg_array}"
  pkg_array.each do |pkg_name|
    Chef::Log.debug "installing #{pkg_name}"
    package pkg_name
  end
end

# Install OS specific packages
if platform_family?('debian')
  node['particle-base']['debian_packages'].each_pair do |category, pkg_array|
    Chef::Log.debug "installing debian specific package #{category} packages: #{pkg_array}"
    pkg_array.each do |pkg_name|
      Chef::Log.debug "installing #{pkg_name}"
      package pkg_name
    end
  end
end
