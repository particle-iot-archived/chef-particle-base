node['particle_base']['directories'].each_pair do |sub_dir_name, full_path|
  directory full_path do
    recursive true
  end
end
