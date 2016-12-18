$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "very_good"

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = "random"
  Kernel.srand config.seed
end
