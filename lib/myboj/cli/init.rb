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
      puts "Successfully initialized"
    end
  end
end
