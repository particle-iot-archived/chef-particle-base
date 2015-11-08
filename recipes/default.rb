[
  'base',
  'openocd',
  'programmer_shield_deploy'
].each do |r|
  include_recipe("particle-programmer-shield::#{r}")
end
