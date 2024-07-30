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
      File.copy_stream(File.join(Myboj.root_dir, "templates", "default_.myboj"), ".myboj")
      File.copy_stream(File.join(Myboj.root_dir, "templates", "default_myboj.config.yaml"), "myboj.config.yaml")
      puts "Successfully initialized"
    end
  end
end
