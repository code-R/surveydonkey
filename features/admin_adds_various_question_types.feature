Feature: Manage Questions on a Survey
  In order to maintain differnt varieties of questions in a survey
  As an Admin
  I should be able to add various types questions to a survey

  Background:
    Given I login as admin
    And There is a survey

  Scenario Outline: Admin adds a date question to a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in "<question_type>" Question details
    And I click "Create Question"
    Then I should see "Question was successfully added."
    And I should see "<question_type>" type in the page
  Examples:
    |question_type|
    |Date|
    |Number|
    |Essay|
    |Multiple choice via radio button|
