# frozen_string_literal: true

RSpec.describe Myboj::ConfigManager do
  subject! { Myboj::ConfigManager.instance }

  context "when myboj.config.yaml file does not exist" do
    before(:context) do
      File.delete("myboj.config.yaml") if File.exist?("myboj.config.yaml")
    end

    it "creates config file and loads it's data in memory" do
      expect(File.exist?("myboj.config.yaml")).to be(true)
      expect(subject.data).not_to be_nil
    end

    describe "#persist" do
      it "persists updated data to myboj.config.yaml file" do
        subject.data["default_language"] = "ruby"
        subject.persist
        expect(File.read("myboj.config.yaml")).to include("default_language: ruby")
      end
    end
  end
end
