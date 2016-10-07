# Install particle-spec Rubygem at compile time so
# it's available for usage directly in recipes that 
# include particle-base
package node['particle_base']['packages']['debian']['ruby_build_packages'] do
  action :nothing
end.run_action(:install)
chef_gem 'particle-spec' do
  version node['particle_base']['particle_spec']['version']
  compile_time true
end
