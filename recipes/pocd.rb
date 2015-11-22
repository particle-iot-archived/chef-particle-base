git node['particle']['programmer_shield']['pocd_git_clone_path'] do
  repo node['particle']['programmer_shield']['pocd_git_clone_url']
  branch node['particle']['programmer_shield']['pocd_git_branch']
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
end

# Update PATH to include pocd wrapper scripts in all shells (for Linux anyway
file "/etc/profile.d/add-pocd-to-path.sh" do
  content <<-EOS
export PATH="#{node['particle']['programmer_shield']['pocd_git_clone_path']}/bin:$PATH"
  EOS
end
