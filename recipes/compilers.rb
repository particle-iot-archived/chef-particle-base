# install gcc
node.override['build-essential']['compile_time'] = true
include_recipe 'build-essential'

log "TODO: Install arm-gcc too"
