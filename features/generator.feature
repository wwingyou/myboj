Feature: Generating testcase
  In order to generate many a thing
  As a CLI newbie
  I want foodie to hold my hand, tightly

  Scenario: Pull testcase of code 1000
    When I run `myboj pull 1000`
    Then the following files should exist:
      | testcase.txt |
    Then the file "testcase.txt" should contain:
      """
      ==테스트 1
      1 2
      =>
      3
      """
