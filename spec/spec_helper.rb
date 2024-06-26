# frozen_string_literal: true

require "myboj"

# Create tmp/rspec directory if not exist
Dir.exist?("tmp/rspec") || Dir.mkdir("tmp/rspec")
original_pwd = Dir.pwd

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    Dir.chdir("tmp/rspec")
  end

  config.after(:suite) do
    Dir.chdir(original_pwd)
  end
end
