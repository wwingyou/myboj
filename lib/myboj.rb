# frozen_string_literal: true

require_relative "myboj/version"
require_relative "myboj/status_manager"
require_relative "myboj/cli"

module Myboj
  class Error < StandardError; end

  class << self
    def status
      StatusManager.instance
    end
  end
end

at_exit do
  Myboj::StatusManager.instance.persist
end
