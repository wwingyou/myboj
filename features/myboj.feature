Feature: Myboj
  In order to portray or pluralize food
  As a CLI
  I want to be as objective as possible

  Scenario: Print version
    When I run `myboj -v`
    Then the output should contain "version"

  Scenario: Pull problem 1000
    When I run `myboj pull 1000`
    Then the output should contain "[1000번] A+B"

  Scenario: Print verbose status
    When I run `myboj status -v`
    Then the output should contain "extra info"
