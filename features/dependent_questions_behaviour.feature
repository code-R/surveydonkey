Feature: dependent questions should be shown when appropriate answers are given
  In order see dependent questions
  As a user
  I should answer proper answer to see those dependent questions

  Background:
    Given There is a survey
    And Survey has 3 multiple choice questions and options
    And second question depends on first question and third question depends on second
    And I login as a normal user
    And I visit survey page
    And I click "Participate"

  Scenario: User should not see dependent question when answered with not dependent option when comparator is
    When I answer first question with a not dependent option
    And I click "Submit"
    Then I should see "Survey is completed."

  Scenario: User should see dependent question when answered with dependent option when comparator is
    When I answer first question with a dependent option
    And I click "Submit"
    Then I should see second question in the survey

  Scenario: User should not see dependent question when answered with dependent option when comparator is not
    When I answer first question with a dependent option
    And I click "Submit"
    When I answer second question with a dependent option with comparator is not
    And I click "Submit"
    Then I should see "Survey is completed."

  Scenario: User should see dependent question when answered with a dependent option when comparator is not
    When I answer first question with a dependent option
    And I click "Submit"
    When I answer second question with a dependent option with comparator is not
    And I click "Submit"
    Then I should see "Survey is completed"

  Scenario: User should see dependent question when answered with not dependent option when comparator is not
    When I answer first question with a dependent option
    And I click "Submit"
    When I answer second question with a non dependent option with comparator is not
    And I click "Submit"
    Then I should see third question in the survey