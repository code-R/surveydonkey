Feature: Edit multiple choice questions
  In order spice up surveys with multiple choice questions
  As an Admin
  I should be able to manage multiple choice questions

  Background:
    Given I login as admin
    And There is a survey
    And Survey has a "multiple_choice_radio_button" Question
    And it has various options

  @javascript
  Scenario: Admin should see options to edit
    When I visit survey edit page
    Then I should see options prefilled in the page