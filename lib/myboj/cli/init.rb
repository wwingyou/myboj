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
      Myboj::StatusManager.instance.create_default_file_if_not_exist
      Myboj::ConfigManager.instance.create_default_file_if_not_exist
      puts "Successfully initialized"
    end
  end
end
