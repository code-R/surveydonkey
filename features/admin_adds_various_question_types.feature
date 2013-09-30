Feature: Manage Questions on a Survey
  In order to maintain differnt varieties of questions in a survey
  As an Admin
  I should be able to add various types questions to a survey

  Background:
    Given I login as admin
    And There is a survey

  Scenario: Admin adds a date question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in "Date" Question details
    And I click "Create Question"
    Then I should see "Question was successfully added."
    And I should see "Date" type in the page

  Scenario: Admin adds a numeric question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in "Number" Question details
    And I click "Create Question"
    Then I should see "Number" type in the page

  Scenario: Admin adds a numeric question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in "Essay" Question details
    And I click "Create Question"
    Then I should see "Essay" type in the page
