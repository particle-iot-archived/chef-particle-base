# 1.4d on debian 8.2
package 'autossh'

# why do we need this: package 'dh-autoreconf'

# friendly menu driven serial communication program
#  Minicom is a clone of the MS-DOS "Telix" communication program. It emulates
#  ANSI and VT102 terminals, has a dialing directory and auto zmodem download
package 'minicom' # serial

# Install node
case node['kernel']['machine']
when 'x86_64'
  log "node.js install not working on x86_64 yet"
when 'armv6l',  # this is the machine architecture of a Raspberry Pi 1 B+
     'armv7l'   # machine architecture of a Raspberry Pi 2 B
  # Install from pre-build arm node package, see http://node-arm.herokuapp.com/
  execute "install node_latest_armhf" do
    command "dpkg -i /root/node_latest_armhf.deb"
    action :nothing
  end
  remote_file '/root/node_latest_armhf.deb' do
    source 'http://node-arm.herokuapp.com/node_latest_armhf.deb'
    # weird to not have checksum here...but that's what you get with "latest"
    notifies :run, "execute[install node_latest_armhf]", :immediately
  end
else
  raise "architecture not supported for node.js install"
end

# build and install dfu-util
bash "build and install dfu-util" do
  cwd "/root"
  code <<-EOS
tar xvf dfu-util-0.8.tar.gz
cd dfu-util-0.8
./configure
make
make install
EOS
  action :nothing
end
remote_file '/root/dfu-util-0.8.tar.gz' do
  source 'http://dfu-util.sourceforge.net/releases/dfu-util-0.8.tar.gz'
  # shasum -a 256 of file
  checksum "55cbde9be12a212bd84bce9d1e63941d9a16139ed0d4912401367eba1502f058"
  notifies :run, "bash[build and install dfu-util]", :immediately
end
