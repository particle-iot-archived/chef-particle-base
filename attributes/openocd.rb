# TODO: get this working again
# default['particle-base']['programmer_shield']['openocd_packages'] = %w(build-essential make libtool pkg-config autoconf automake texinfo libusb-dev libusb-1.0-0 libusb-1.0-0-dev gdb)
# default['particle-base']['programmer_shield']['openocd_git_clone_url'] = 'git://git.code.sf.net/p/openocd/code'
# default['particle-base']['programmer_shield']['openocd_git_branch'] = 'v0.9.0'
# # This will be exit-code 0 when we're installed and good, and non 0 otherwise
# # This won't work unless the openocd_git_branch begins with a vX.Y.Z
# default['particle-base']['programmer_shield']['openocd_version_check'] = "which openocd && openocd --version 2>&1 | grep -F '#{node['particle-base']['programmer_shield']['openocd_git_branch'].gsub(/^v/,'')}'"
# default['particle-base']['programmer_shield']['openocd_git_clone_path'] = "#{node['particle-base']['programmer_shield']['shared_dir']}/openocd"


# Revisit this, rename repo to particle-openocd-scripts
# pocd wrapper scripts, configures these scripts to be in the default path and puts binaries in place to make command
# line usability tiiiight
#
# default['particle-base']['programmer_shield']['pocd_git_clone_path'] = "#{node['particle-base']['programmer_shield']['shared_dir']}/pocd"
# default['particle-base']['programmer_shield']['pocd_git_clone_url'] = 'git@github.com:spark/pocd.git'
# default['particle-base']['programmer_shield']['pocd_git_branch'] = 'master'
