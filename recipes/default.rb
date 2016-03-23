include_recipe("particle-programmer-shield::base")
# [
#   'base',
#   # 'programmer_shield_env',
#   # 'programmer_shield_cfg_files',
#   # 'openocd', # depends on the programmer_shield_cfg_files recipe
#   'pocd', # wrapper scripts for openocd
#   # 'programmer_shield_firmware_binaries', # puts them in pocd/binaries/factory dir
#   # Temporary stuff that needs refinement/might not be open sourced
#   # 'misc_stuff_from_old_programmer_rig'
# ].each do |r|
#   include_recipe("particle-programmer-shield::#{r}")
# end
