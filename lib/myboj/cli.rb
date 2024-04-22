# frozen_string_literal: true

require "thor"

module Myboj
  class CLI < Thor
    desc "새 문제 가져오기", "지정한 코드의 문제의 테스트케이스와 정보를 가져옵니다."
    def pull(code)
      puts "[1000번] A+B"
    end

    desc "상태 출력", "현재 문제 정보, 언어, 로그인 상태 등을 출력합니다."
    method_option :verbose, aliases: "-v"
    def status
      puts "status info"
      puts "extra info" unless options[:verbose].nil?
    end
  end
end
