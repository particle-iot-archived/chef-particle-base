[
  'base',
  'programmer_shield_cfg_files',
  'programmer_shield_firmware_binaries',
  'programmer_shield_wrapper_scripts',
  'programmer_shield_env',
  'openocd'
].each do |r|
  include_recipe("particle-programmer-shield::#{r}")
end
