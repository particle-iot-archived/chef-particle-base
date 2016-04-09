# default['particle-base']['arm_gcc']['4.9-2015-q2']['url'] = 'https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/gcc-arm-none-eabi-4_9-2015q2-20150609-linux.tar.bz2'
# default['particle-base']['arm_gcc']['4.9-2015-q2']['install_path_version'] = File.basename(node['particle-base']['gcc_arm_embedded']['4.9-2015-q2']['url']).gsub(/[\.\s]+/,'-')
# default['particle-base']['arm_gcc']['4.9-2015-q2']['sha256_checksum'] = '3a574c5becfca496bafe07bbd76e9deae1fd0cc99c5a9de0f8c610750f2f89ac'
# default['particle-base']['arm_gcc']['4.9-2015-q2']['binary_reported_version'] = '4.9.3 20150529'

arm_gcc_platform_key = if platform_family?('mac_os_x')
  "mac_os_x"
elsif platform_family?('windows')
  raise "not implemented"
else # assume linux
  "linux"
end
node['particle-base']['arm_gcc'][arm_gcc_platform_key].each_pair do |version, attribs|
  ark "arm-gcc-#{version}" do
    url attribs['url']
    version(File.basename(attribs['binary_reported_version']).gsub(/[\.\s]+/,'-'))
    checksum attribs['sha256_checksum']
    extension 'tar.bz2'
    action :install
  end
end
# # Add install_path/bin to $PATH for all shells
# # the ark resource above symlinks /usr/local/gcc-arm/embedded to the particular version dir
# file node['spark_cloud']['gcc_arm_embedded']['global_shell_config_file'] do
#   owner "root"
#   group "root"
#   mode "0644"
#   content "export PATH=#{node['spark_cloud']['gcc_arm_embedded']['binaries_path']}:$PATH"
# end
