Feature: Manage Questions on a Survey
  In order to participate in surveys
  As a User
  Admin should be able to add questions to a survey

  Background:
    Given I login as admin
    And There is a survey

  Scenario: Admin adds a date question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in Question details
    And I click "Create Question"
    Then I should see "Question was successfully added."

  Scenario: Admin adds a date question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I click "Create Question"
    Then I should see "can't be blank"

  Scenario: Admin sees a list of questions added on a survey
    Given Survey has some questions added
    When I visit survey page as admin
    Then I should see list of Questions
    And I should see edit and destroy links on a question