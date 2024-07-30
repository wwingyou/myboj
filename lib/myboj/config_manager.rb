# frozen_string_literal: true

require "singleton"
require "yaml"

module Myboj
  class ConfigManager
    include Singleton

    attr_reader :data

    def initialize
      create_default_file_if_not_exist
      load_file
    end

    def create_default_file_if_not_exist
      unless File.exist?("myboj.config.yaml")
        File.copy_stream(
          File.join(Myboj.root_dir, "templates", "default_myboj.config.yaml"),
          "myboj.config.yaml"
        )
        true
      end

      false
    end

    def load_file
      if File.exist?("myboj.config.yaml")
        @data = YAML.safe_load(File.read("myboj.config.yaml"))
        true
      end

      false
    end

    def persist
      File.open("myboj.config.yaml", "w") do |file|
        file.puts YAML.dump(@data)
      end
    end
  end
end
