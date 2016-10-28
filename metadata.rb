name 'particle_base'
maintainer 'Joe Goggins'
maintainer_email 'joe@particle.io'
license 'Apache 2.0'
description 'Installs/Configures useful tools for programming, testing, and interacting with Particle Devices (https://www.particle.io)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.1'
recipe 'particle_base::default', 'Installs minimal dependencies for target OS'
%w(debian ubuntu mac_os_x).each do |os|
  supports os
end
depends 'build-essential'
depends 'ark'
depends 'apt'
source_url 'https://github.com/spark/chef-particle-base'
issues_url 'https://github.com/spark/chef-particle-base/issues'
