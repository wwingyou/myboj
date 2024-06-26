# frozen_string_literal: true

module Myboj
  class CLI::Status
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      puts "language: python"
    end
  end
end
