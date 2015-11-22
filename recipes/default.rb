[
  'base',
  'programmer_shield_firmware_binaries',
  'programmer_shield_env',
  'programmer_shield_cfg_files',
  'openocd', # depends on the programmer_shield_cfg_files recipe
  'pocd', # wrapper scripts for openocd
  'misc_stuff_from_old_programmer_rig'
].each do |r|
  include_recipe("particle-programmer-shield::#{r}")
end
