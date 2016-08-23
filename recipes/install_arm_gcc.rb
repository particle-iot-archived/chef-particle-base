arm_gcc_platform_key = if platform_family?('mac_os_x')
  "mac_os_x"
elsif platform_family?('windows')
  raise "not implemented"
else # assume linux
  "linux"
end
node['particle_base']['arm_gcc'][arm_gcc_platform_key].each_pair do |version, attribs|
  ark "arm-gcc-#{version}" do
    url attribs['url']
    version(File.basename(attribs['binary_reported_version']).gsub(/[\.\s]+/,'-'))
    checksum attribs['sha256_checksum']
    extension 'tar.bz2'
    action :install
  end
end
