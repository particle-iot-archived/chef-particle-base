include_recipe('particle_base::update_package_index')
include_recipe('particle_base::install_every_node_packages')
include_recipe('particle_base::install_arm_gcc')
include_recipe('particle_base::install_bats')
include_recipe('particle_base::install_scripts')
include_recipe('particle_base::install_particle_cli_ng')

# Deliberately not included/increases the dependencies significantly
# and doesn't work reliably on any platforms yet
# include_recipe('particle_base::install_particle_spec_rubygem')
