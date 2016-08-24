bash "install bats test runner to /usr/local" do
  cwd '/tmp'
  code <<-EOS
git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr/local
  EOS
  not_if "which bats"
end
