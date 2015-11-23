# we need this, because we place binaries in a sub-dir of this clone
include_recipe('particle-programmer-shield::pocd')

# Grab the photon factory default binary
remote_file "#{node['particle']['programmer_shield']['pocd_git_clone_path']}/binaries/factory/photon_rc4.bin" do
  source "http://factory-firmware-binaries.particle.io/2015-04-08-photon-manufacturing-release-rc4/all-rc4-update/combined_BM-09.bin"
  # shasum -a 256 to get this
  checksum '4b6a9932b2967a3832e8dade1631a514b131d775a384763a5cb94e4f6232a226'
end
