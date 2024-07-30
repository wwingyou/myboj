# frozen_string_literal: true

module Myboj
  class CLI::Config
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run(key, value)
      if key == "default_language"
        Myboj.config.data["default_language"] = value
        puts "Change default language to #{value}"
      end
    end
  end
end
