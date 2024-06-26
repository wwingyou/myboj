Feature: Manage myboj repository
  In order to create and manage myboj repository
  As CLI
  I want to init, config, checkout and show status

  Scenario: Print version
    When I run `myboj -v`
    Then the output should contain "version"

  Scenario: Init repository first time
    Given the file named ".myboj" does not exist
    When I run `myboj init`
    Then the output should contain "Successfully initialized"
    Then the following files should exist:
      | .myboj |
    Then the file ".myboj" should contain:
      """
      language: python
      problem: -1
      """

  Scenario: Try to init repository again
    Given current repository is initialized
    When I run `myboj init`
    Then the output should contain "Already initialized"

  Scenario: Config language
    Given current repository is initialized
    When I run `myboj config language python`
    Then the output should contain "change to python"

  Scenario: Show status 
    Given current repository is initialized
    When I run `myboj status`
    Then the output should contain "language: python"
