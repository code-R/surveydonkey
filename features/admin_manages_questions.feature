Feature: Manage Questions on a Survey
  In order to participate in surveys
  As a User
  Admin should be able to add questions to a survey

  Background:
    Given I login as admin
    And There is a survey

  Scenario: Admin adds a date question to a survey with invalid data
    When I visit survey page as admin
    And I click "Add Question"
    And I click "Create Question"
    Then I should see "can't be blank"

  Scenario: Admin sees a list of questions added on a survey
    Given Survey has some questions added
    When I visit survey page as admin
    Then I should see list of Questions

  Scenario: Admin deletes a question on a given survey
    Given Survey has some questions added
    When I visit survey page as admin
    And I click on a question
    And I click destroy on a question
    Then I should see "Question was successfully destroyed."

  Scenario: Admin edits a question on a given survey
    Given Survey has some questions added
    When I visit survey page as admin
    And I click edit on a question
    Then I should go to question edit page

  Scenario: Admin updates a question on a given survey
    Given Survey has some questions added
    When I visit question edit page
    And I fill in question info
    And I click "Update Question"
    Then I should see "Question was successfully updated."
