require 'chefspec'
require 'chefspec/policyfile'
RSpec.configure do |config|
  config.log_level = :debug
  # Specify the path to a local JSON file with Ohai data (default: nil)
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'
  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '14.04'
end
