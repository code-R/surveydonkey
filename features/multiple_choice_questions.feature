Feature: Manage multiple choice questions
  In order spice up surveys with multiple choice questions
  As an Admin
  I should be able to manage multiple choice questions

  Background:
    Given I login as admin
    And There is a survey
    And I visit survey page as admin
    And I click "Add Question"

  Scenario: Admin should see options when I choose multiple choice question
    When I fill in "Multiple choice via radio button" Question details
    Then I should see options area

  Scenario: Admin should not see options when I choose any other question type
    When I fill in "Multiple choice via radio button" Question details
    And I fill in "Date" Question details
    Then I should not see options area

  Scenario: Admin adds options to multiple choice questions
    When I fill in "Multiple choice via radio button" Question details
    And I fill in option details
    And I click "Create Question"
    Then I should see options on that question