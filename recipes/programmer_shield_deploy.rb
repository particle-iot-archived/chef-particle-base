# Use a deploy resource instead of a git resource
deploy_revision node['particle']['programmer_shield']['deploy_dir'] do
  repo node['particle']['programmer_shield']['git_clone_url']
  branch node['particle']['programmer_shield']['git_branch']
  user node['particle']['programmer_shield']['user']
  group node['particle']['programmer_shield']['user']
  # Initialize layout modifiers to nothing, defaults are annoying (overly Railsy)
  symlink_before_migrate       Hash.new
  create_dirs_before_symlink   []
  purge_before_symlink         []
  symlinks                     Hash.new
  keep_releases 5
  rollback_on_error false
end
