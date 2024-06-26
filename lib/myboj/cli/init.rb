# frozen_string_literal: true

module Myboj
  class CLI::Init
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      if File.exist?(".myboj")
        puts "Already initialized"
        return
      end
      File.open(".myboj", "w") do |file|
        file.puts "language: python"
        file.puts "problem: -1"
      end
      puts "Successfully initialized"
    end
  end
end
