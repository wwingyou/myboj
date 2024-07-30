# frozen_string_literal: true

require "singleton"

module Myboj
  class StatusManager < Hash
    include Singleton

    def initialize
      super
      create_default_file_if_not_exist
      load_file
    end

    def create_default_file_if_not_exist
      unless File.exist?(".myboj")
        File.copy_stream(
          File.join(Myboj.root_dir, "templates", "default_.myboj"),
          ".myboj"
        )
        true
      end

      false
    end

    def load_file
      if File.exist?(".myboj")
        File.open(".myboj", "r") do |file|
          file.readlines.each do |line|
            key, value = line.chomp.split(": ")
            self[key] = value
          end
        end
        true
      end

      false
    end

    def persist
      File.open(".myboj", "w") do |file|
        each do |key, value|
          file.puts "#{key}: #{value}"
        end
      end
    end
  end
end
