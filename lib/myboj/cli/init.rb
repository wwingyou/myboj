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
      File.new(".myboj", "w") do |file|
        # TODO: write initial file content
      end
      puts "Successfully initialized"
    end
  end
end
