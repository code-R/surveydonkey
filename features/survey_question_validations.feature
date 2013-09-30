Feature: Survey Question validations
  In order answer proper answers to a question in a survey
  As a User
  Question responses should be validated based on type

  Background:
    Given There is a survey
    And Survey has a Date Question
    And I login as a normal user

  Scenario: User should be able to view participate link on survey page
    When I visit survey page
    Then I should find participate link

  Scenario: User should see date type input
    When I visit survey page
    And I click "Participate"
    Then I should see datepicker type input