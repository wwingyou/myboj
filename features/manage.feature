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

  Scenario: Change to valid language
    Given current repository is initialized
    When I run `myboj change language java`
    Then the output should contain "Change to java"
    Then the file ".myboj" should contain:
    """
    language: java
    """

  Scenario: Change to invalid language
    Given current repository is initialized
    When I run `myboj change language some_strange_language`
    Then the output should contain "Invalid language"
    Then the exit status should be 1

  Scenario: Change to valid problem
    Given current repository is initialized
    When I run `myboj change problem 1000`
    Then the output should contain "Change problem to 1000"
    Then the file ".myboj" should contain:
    """
    problem: 1000
    """

  Scenario: Change to invalid problem
    Given current repository is initialized
    When I run `myboj change problem 5784592396234`
    Then the output should contain "Invalid problem code"
    Then the exit status should be 1

  Scenario: Config language
    Given current repository is initialized
    When I run `myboj config language python`
    Then the output should contain "change to python"

  Scenario: Show status 
    Given current repository is initialized
    When I run `myboj change language ruby`
    When I run `myboj change problem 1000`
    When I run `myboj status`
    Then the output should contain "language: ruby"
    Then the output should contain "problem: 1000"
