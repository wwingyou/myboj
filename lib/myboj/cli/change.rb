# frozen_string_literal: true

module Myboj
  class CLI::Change
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run(key, value)
      if key == "language"
        if %w[python java ruby].include?(value)
          Myboj.status[key] = value
          puts "Change to #{value}"
        else
          puts "Invalid language: #{value}"
          exit 1
        end
      elsif key == "problem"
        if value.to_i.negative? || value.to_i > 10_000
          puts "Invalid problem code"
          exit 1
        else
          Myboj.status[key] = value
          puts "Change problem to #{value}"
        end
      end
    end
  end
end
