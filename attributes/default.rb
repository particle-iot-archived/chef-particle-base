# Global vars that will be present in all Particle Cookbooks
default['particle']['base_dir'] = '/particle'
default['particle']['misc_dir'] = "#{node['particle']['base_dir']}/misc"
default['particle']['packages'] = %w(git tmux htop vim tree)
default['particle']['do_update_packages'] = true

# Programmer shield specific vars
default['particle']['programmer_shield']['user'] = 'root'
default['particle']['programmer_shield']['git_clone_url'] = 'https://github.com/spark/shields' # note; must use https, 'git@github.com:spark/shields.git' won't work without ssh auth
default['particle']['programmer_shield']['git_branch'] = 'master'
default['particle']['programmer_shield']['project_name'] = "programmer-shield"
default['particle']['programmer_shield']['deploy_dir'] = "#{node['particle']['base_dir']}/#{node['particle']['programmer_shield']['project_name']}"
default['particle']['programmer_shield']['working_dir'] = "#{node['particle']['programmer_shield']['deploy_dir']}/current"
default['particle']['programmer_shield']['shared_dir'] = "#{node['particle']['programmer_shield']['deploy_dir']}/shared"

# OpenOCD/FTDI stuff
default['particle']['programmer_shield']['openocd_packages'] = %w(build-essential make libtool pkg-config autoconf automake texinfo libusb-dev libusb-1.0-0 libusb-1.0-0-dev gdb)
default['particle']['programmer_shield']['openocd_git_clone_url'] = 'git://git.code.sf.net/p/openocd/code'
default['particle']['programmer_shield']['openocd_git_branch'] = 'v0.9.0'
default['particle']['programmer_shield']['openocd_version_check'] = "openocd --version 2>&1 | grep #{node['particle']['programmer_shield']['openocd_git_branch']}"
default['particle']['programmer_shield']['openocd_git_clone_path'] = "#{node['particle']['programmer_shield']['shared_dir']}/openocd"
