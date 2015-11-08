# install required OS level packages for OpenOCD usage
node['particle']['programmer_shield']['openocd_packages'].each do |p|
  package p
end

# Grab the openocd git repo
git node['particle']['programmer_shield']['openocd_git_clone_path'] do
  repo node['particle']['programmer_shield']['openocd_git_clone_url']
  branch node['particle']['programmer_shield']['openocd_git_branch']
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# Link to the particle-ftdi.cgf file in the right place so the subsequent build works + includes required stuff
link "#{node['particle']['programmer_shield']['openocd_git_clone_path']}/tcl/interface/ftdi/particle-ftdi.cfg" do
  to node['particle']['programmer_shield']['env']['PARTICLE_CFG_PATH']
end

# TODO: copy udev rules, so we don't need to be root
# sudo cp contrib/99-openocd.rules /etc/udev/rules.d/

bash "bootstrap, configure, make, and make install openocd" do
  cwd node['particle']['programmer_shield']['openocd_git_clone_path']
  code <<-EOS
./bootstrap
./configure --enable-ftdi
make
make install
EOS
  user node['particle']['programmer_shield']['user']
  not_if node['particle']['programmer_shield']['openocd_version_check']
end
