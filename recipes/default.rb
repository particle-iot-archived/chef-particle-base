include_recipe('particle-base::user')
include_recipe('particle-base::packages')
include_recipe 'build-essential'
include_recipe('particle-base::arm_gcc')
include_recipe('particle-base::directories')
include_recipe('particle-base::scripts')
include_recipe('particle-base::particle_cli_ng')
