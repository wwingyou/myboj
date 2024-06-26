# frozen_string_literal: true

require "thor"

module Myboj
  # NOTE: impelment each cli command under 'myboj/cli' and use it here. 
  class CLI < Thor
    package_name "myboj"
    map "-v" => :version

    desc "version", "현재 버전을 출력합니다."
    def version
      puts "myboj version #{Myboj::VERSION}"
    end

    desc "init", "initialize myboj repository."
    def init
      require_relative "cli/init"

      options = {}
      Init.new(options).run
    end

    desc "pull [CODE]", "지정한 코드의 문제의 테스트케이스와 정보를 가져옵니다."
    def pull(code)
      puts "[1000번] A+B"
    end

    desc "status", "현재 문제 정보, 언어, 로그인 상태 등을 출력합니다."
    method_option :verbose, aliases: "-v"
    def status
      puts "status info"
      puts "extra info" unless options[:verbose].nil?
    end
  end
end
