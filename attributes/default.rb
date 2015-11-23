# Global vars that will be present in all Particle Cookbooks
default['particle']['base_dir'] = '/particle'
default['particle']['misc_dir'] = "#{node['particle']['base_dir']}/misc"
default['particle']['packages'] = %w(git tmux htop vim tree ca-certificates ntpdate)
default['particle']['do_update_packages'] = true

# Programmer shield specific vars
default['particle']['programmer_shield']['user'] = 'root'
# we don't clone this repo, it's fucking huge, instead we grab files directly from github
# default['particle']['programmer_shield']['git_clone_url'] = 'https://github.com/spark/shields' # note; must use https, 'git@github.com:spark/shields.git' won't work without ssh auth
# default['particle']['programmer_shield']['git_branch'] = 'master'
# default['particle']['programmer_shield']['git_path'] = 'photon-shields/programmer-shield'
default['particle']['programmer_shield']['project_name'] = "programmer-shield"
default['particle']['programmer_shield']['deploy_dir'] = "#{node['particle']['base_dir']}/#{node['particle']['programmer_shield']['project_name']}"
default['particle']['programmer_shield']['working_dir'] = "#{node['particle']['programmer_shield']['deploy_dir']}/current"
default['particle']['programmer_shield']['shared_dir'] = "#{node['particle']['programmer_shield']['deploy_dir']}/shared"
default['particle']['programmer_shield']['official_binaries'] = "#{node['particle']['programmer_shield']['shared_dir']}/official_binaries"

# OpenOCD/FTDI stuff
default['particle']['programmer_shield']['openocd_packages'] = %w(build-essential make libtool pkg-config autoconf automake texinfo libusb-dev libusb-1.0-0 libusb-1.0-0-dev gdb)
default['particle']['programmer_shield']['openocd_git_clone_url'] = 'git://git.code.sf.net/p/openocd/code'
default['particle']['programmer_shield']['openocd_git_branch'] = 'v0.9.0'
# This will be exit-code 0 when we're installed and good, and non 0 otherwise
# This won't work unless the openocd_git_branch begins with a vX.Y.Z
default['particle']['programmer_shield']['openocd_version_check'] = "which openocd && openocd --version 2>&1 | grep -F '#{node['particle']['programmer_shield']['openocd_git_branch'].gsub(/^v/,'')}'"
default['particle']['programmer_shield']['openocd_git_clone_path'] = "#{node['particle']['programmer_shield']['shared_dir']}/openocd"

# Environment variables + remote content + config
default['particle']['programmer_shield']['env']['OPENOCD_TARGETS_DIR'] = '/usr/local/share/openocd/scripts/target'
default['particle']['programmer_shield']['env']['STM32F2X_CFG_PATH'] = "#{node['particle']['programmer_shield']['env']['OPENOCD_TARGETS_DIR']}/stm32f2x.cfg"
default['particle']['programmer_shield']['env']['PARTICLE_CFG_PATH'] = "#{node['particle']['programmer_shield']['shared_dir']}/particle-ftdi.cfg"
default['particle']['programmer_shield']['remote_sources']['PARTICLE_CFG_PATH'] = "https://raw.githubusercontent.com/spark/shields/master/photon-shields/programmer-shield/particle-ftdi.cfg"


# pocd wrapper scripts, configures these scripts to be in the default path and puts binaries in place to make command
# line usability tiiiight
#
default['particle']['programmer_shield']['pocd_git_clone_path'] = "#{node['particle']['programmer_shield']['shared_dir']}/pocd"
default['particle']['programmer_shield']['pocd_git_clone_url'] = 'git@github.com:spark/pocd.git'
default['particle']['programmer_shield']['pocd_git_branch'] = 'master'
