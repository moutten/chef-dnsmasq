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
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
