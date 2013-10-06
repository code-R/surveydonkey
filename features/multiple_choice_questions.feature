Feature: Edit multiple choice questions
  In order spice up surveys with multiple choice questions
  As an Admin
  I should be able to manage multiple choice questions

  Background:
    Given I login as admin
    And There is a survey

  @javascript
  Scenario: Admin should see options to edit
    When Survey has a "multiple_choice_radio_button" Question
    And it has various options
    And I visit survey edit page
    Then I should see options prefilled in the page

  Scenario Outline: User should see relevent input type based on question type
    When Survey has a "<question_type>" Question
    And "<question_type>" has various options
    And I visit survey edit page
    And I visit survey page
    And I click "Participate"
    Then I should see "<question_type>" type input for mcq
  Examples:
    |question_type               |
    |multiple_choice_radio_button|
    |multiple_choice_select      |


  # Scenario: User should see radio button type input
  #   When Survey has a "multiple_choice_select" Question
  #   And it has various options
  #   And I visit survey edit page
  #   And I visit survey page
  #   And I click "Participate"
  #   Then I should see multiple_choice_select type input