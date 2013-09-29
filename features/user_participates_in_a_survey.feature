Feature: User participates in a survey
  In order to see a list of responses on a survey
  As an admin
  User should be able to participate in a survey

  Background:
    Given There is a survey
    And Survey has some questions added
    And I login as a normal user

  Scenario: User should be able to view participate link on survey page
    When I visit survey page
    Then I should find participate link

  Scenario: User starts on a survey without any questions
    When I visit survey page
    And Survey has no questions
    And I click "Participate"
    Then I should see "There are no questions added in the survey"

  Scenario: User starts on a survey with questions
    When I visit survey page
    And I click "Participate"
    Then I should start on survey
