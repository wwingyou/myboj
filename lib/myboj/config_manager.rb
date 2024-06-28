# frozen_string_literal: true

require "singleton"
require "yaml"

module Myboj
  class ConfigManager
    include Singleton

    attr_reader :data

    def initialize
      unless File.exist?("myboj.config.yaml")
        File.open("myboj.config.yaml", "w") do |file|
          file.puts <<~CONTENT
            ---
            language:
              - python:
                  cmd: python {file}
                  ext: py
              - java:
                  cmd: java {file}
                  ext: java
              - ruby:
                  cmd: ruby {file}
                  ext: rb
            default_language: python
          CONTENT
        end
      end

      @data = YAML.load(File.read("myboj.config.yaml"))
    end

    def persist
      File.open("myboj.config.yaml", "w") do |file|
        file.puts YAML.dump(@data)
      end
    end
  end
end
