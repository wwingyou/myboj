# frozen_string_literal: true

module Myboj
  class CLI::Change
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run(key, value)
      if key == "language"
        puts "change to #{value}"
      else
        puts "change to #{key}: #{value}"
      end
    end
  end
end
