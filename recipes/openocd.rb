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
