case node['platform_family']
when 'debian' # includes ubuntu
  node.set['apt']['compile_time_update'] = true
  include_recipe('apt')
when 'mac_os_x'
  ruby_block "error if homebrew is not already installed" do
    block do
      raise "You must install homebrew beforehand before running this recipe"
    end
    not_if "which brew"
  end
  execute "brew update"
else
  log "Cannot update package index for platform_family=#{node['platform_family']}" do
    level :error
  end
end
