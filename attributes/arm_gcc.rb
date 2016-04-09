# # create a .sh file that RHEL and most linux systems will source when starting to add stuff to the path
# default['particle-base']['gcc_arm_embedded']['global_shell_config_file'] = "/etc/profile.d/add-gcc-arm-bin-to-path.sh"
# default['particle-base']['gcc_arm_embedded']['binaries_path'] = "/usr/local/#{node['particle-base']['gcc_arm_embedded']['package_name']}/bin"
#
default['particle-base']['arm_gcc']['mac_os_x']['4.9-2015-q2']['url'] = 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/gcc-arm-none-eabi-4_9-2015q2-20150609-mac.tar.bz2'
default['particle-base']['arm_gcc']['mac_os_x']['4.9-2015-q2']['sha256_checksum'] = '48841185eefa482f0338059dd779b3edf832521ccd05811d557ef4a2807b8284'
default['particle-base']['arm_gcc']['mac_os_x']['4.9-2015-q2']['binary_reported_version'] = '4.9.3 20150529'

# should work the same on Debian and RHEL systems
default['particle-base']['arm_gcc']['linux']['4.9-2015-q2']['url'] = 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/gcc-arm-none-eabi-4_9-2015q2-20150609-linux.tar.bz2'
default['particle-base']['arm_gcc']['linux']['4.9-2015-q2']['sha256_checksum'] = '3a574c5becfca496bafe07bbd76e9deae1fd0cc99c5a9de0f8c610750f2f89ac'
default['particle-base']['arm_gcc']['linux']['4.9-2015-q2']['binary_reported_version'] = '4.9.3 20150529'
