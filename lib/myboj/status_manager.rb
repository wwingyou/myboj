# frozen_string_literal: true

module Myboj
  class StatusManager < Hash
    def self.instance
      @instance ||= StatusManager.new
    end

    def initialize
      super

      puts "[Debug] Initializing StatusManager..."
      unless File.exist?(".myboj")
        puts "[Debug] No .myboj file found. Initializing .myboj file..."
        File.open(".myboj", "w") do |file|
          file.puts <<~CONTENT
            language: python
            problem: -1
          CONTENT
        end
      end

      File.open(".myboj", "r") do |file|
        file.readlines.each do |line|
          key, value = line.chomp.split(": ")
          self[key] = value
        end
      end
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
