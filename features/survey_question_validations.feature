Feature: Survey Question validations
  In order answer proper answers to a question in a survey
  As a User
  Question responses should be validated based on type

  Background:
    Given There is a survey
    And I login as a normal user

  Scenario: User should be able to view participate link on survey page
    When I visit survey page
    Then I should find participate link

  Scenario Outline: User should see input type based on question type
    When I visit survey page
    And Survey has a "<question_type>" Question
    And I click "Participate"
    Then I should see "<input_type>" type input
  Examples:
    |question_type| input_type  |
    |date         | date_picker |
    |number       | numeric     |
    |essay        | text        |


  Scenario Outline: User answer should be a date if survey question is of date type
    When I visit survey page
    And Survey has a "<question_type>" Question
    And I click "Participate"
    And I answer with some text
    Then I should see invalid "<question_type>" message
  Examples:
    |question_type|
    |date         |
    |number       |
