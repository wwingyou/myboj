# frozen_string_literal: true

Given("current repository is initialized") do
  step %(a file named ".myboj" with:), <<~CONTENT
    language: python
    problem: -1
  CONTENT
end

Given("default files are available") do
  copy("%/default_.myboj", "default_.myboj")
  copy("%/default_myboj.config.yaml", "default_myboj.config.yaml")
end
