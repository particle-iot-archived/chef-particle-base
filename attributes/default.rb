###
# Where does everything go?
###
default['particle-base']['dir'] = '/opt/particle-base'

###
# What packages does it install?
# These defaults are opinions, provided a package is not huge, installs cleanly on >= RPi2 Debian 8.2 and friends, issue a PR and we'll probably merge it
###
default['particle-base']['do_update_packages'] = true

# COMMON PACKAGES
default['particle-base']['packages']['essentials'] = %w(git)
default['particle-base']['packages']['terminal-multiplexers'] = %w(tmux screen)
# From http://czmq.zeromq.org/page:get-the-software, "you will need build-essentials, libtool, autoconf, automake and uuid-dev or equivalent."
# todo: look into
default['particle-base']['packages']['zmq-build'] = %w(libtool)

# Debian only packages
default['particle-base']['debian_packages']['essentials'] = %w(ca-certificates ntpdate)
default['particle-base']['debian_packages']['editors'] = %w(vim nano)
default['particle-base']['debian_packages']['linux-admin'] = %w(htop tree)


###
# What user do all of the tools get installed with and used by?
###
default['particle-base']['user'] = 'ci'
default['particle-base']['group'] = if platform_family?('mac_os_x')
                                      "admin"
                                    else
                                      "ci"
                                    end

default['particle-base']['user_home_dir'] = if platform_family?('mac_os_x')
                                              "/Users/#{node['particle-base']['user']}"
                                            else
                                              "/home/#{node['particle-base']['user']}"
                                            end


###
# How do I update stuff?
###
default['particle-base']['scripts']['update_cookbook_and_converge'] = "#{node['particle-base']['dir']}/bin/update-and-converge"


###
# particle-cli-installer
###
default['particle-base']['tmp_dir'] = "#{node['particle-base']['dir']}/tmp"

# Install particle-cli from Julien's installer: https://dfu55fst9l042.cloudfront.net/index.html
# installer URLs from https://dfu55fst9l042.cloudfront.net/index.html
default['particle-base']['particle-cli-installer']['source_url'] = if platform_family?('mac_os_x')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/darwin/amd64/particle-cli-ng.gz"
elsif platform_family?('debian')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/linux/amd64/particle-cli-ng.gz"
elsif platform_family?('windows')
  "https://dfu55fst9l042.cloudfront.net/master/0.0.1-dedbf1f/windows/amd64/particle-cli-ng.exe"
else
  raise "particle-cli-installer not supported on #{node['platform_family']}"
end
default['particle-base']['particle-cli-installer']['download_path'] = "#{node['particle-base']['tmp_dir']}/#{File.basename(node['particle-base']['particle-cli-installer']['source_url'])}"
default['particle-base']['particle-cli-installer']['executable_name'] = if platform_family?('windows')
  'particle-cli-ng.exe'
else
  'particle-cli-ng'
end
default['particle-base']['particle-cli-installer']['working_dir'] = File.dirname(node['particle-base']['particle-cli-installer']['download_path'])
default['particle-base']['particle-cli-installer']['executable_path'] = "#{node['particle-base']['particle-cli-installer']['working_dir']}/#{node['particle-base']['particle-cli-installer']['executable_name']}"
