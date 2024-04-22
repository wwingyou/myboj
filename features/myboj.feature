Feature: Myboj
  In order to portray or pluralize food
  As a CLI
  I want to be as objective as possible

  Scenario: Print version
    When I run `myboj -v`
    Then the output should contain "version"
