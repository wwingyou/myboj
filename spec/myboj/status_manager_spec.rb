# frozen_string_literal: true

require "myboj/status_manager"

RSpec.describe Myboj::StatusManager do
  subject! { Myboj::StatusManager.instance }

  context "when .myboj file initially does not exist" do
    before(:context) do
      File.delete(".myboj") if File.exist?(".myboj")
    end

    it "manages .myboj file and stores it's data in memory" do
      expect(File.exist?(".myboj")).to be(true)
      expect(subject["language"]).to eq("python")
      expect(subject["problem"]).to eq("-1")
    end

    it "can persist updated status to .myboj file" do
      subject["language"] = "ruby"
      subject["problem"] = "1000"

      subject.persist

      expect(File.exist?(".myboj")).to be(true)
      expect(File.read(".myboj")).to eq(
        <<~CONTENT
          language: ruby
          problem: 1000
        CONTENT
      )
    end
  end

  context "When .myboj file initailly exists" do
    before(:context) do
      File.open(".myboj", "w") do |file|
        file.puts <<~CONTENT
          language: ruby
          problem: 1000
        CONTENT
      end
    end

    it "loads .myboj file and stores it's data in memory" do
      expect(File.exist?(".myboj")).to be(true)
      expect(subject["language"]).to eq("ruby")
      expect(subject["problem"]).to eq("1000")
    end
  end
end
