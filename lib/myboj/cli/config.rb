# frozen_string_literal: true

module Myboj
  class CLI::Config
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run(key, value)
      puts "change to python"
    end
  end
end
