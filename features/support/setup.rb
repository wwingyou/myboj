# frozen_string_literal: true

require "aruba/cucumber"

Aruba.configure do |config|
  config.fixtures_directories = ["templates"]
end
