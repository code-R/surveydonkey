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

  Scenario: User should see date type input
    When I visit survey page
    And Survey has a "date" Question
    And I click "Participate"
    Then I should see "date_picker" type input

  Scenario: User should see number type input
    When I visit survey page
    And Survey has a "number" Question
    And I click "Participate"
    Then I should see "numeric" type input

  Scenario: User answer should be a date if survey question is of date type
    When I visit survey page
    And Survey has a "date" Question
    And I click "Participate"
    And I answer with some text
    Then I should see invalid "date" message

  Scenario: User answer should be a number if survey question is of number type
    When I visit survey page
    And Survey has a "number" Question
    And I click "Participate"
    And I answer with some text
    Then I should see invalid "number" message