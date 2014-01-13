require 'chefspec'
require 'chefspec/berkshelf'

# To deal with the issue described
# here: https://github.com/dtao/safe_yaml/issues/10
SafeYAML::OPTIONS[:deserialize_symbols] = true
# To disable warning about loading unsafe yml
SafeYAML::OPTIONS[:default_mode] = :safe

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version  = '12.04'
end
