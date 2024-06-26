Given("current repository is initialized") do
  step %(a file named ".myboj" with:), <<~CONTENT
    language: python
    problem: -1
  CONTENT
end
