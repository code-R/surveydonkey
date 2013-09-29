Feature: User participates in a survey
  In order to see a list of responses on a survey
  As an admin
  User should be able to participate in a survey

  Background:
    Given There is a survey
    And Survey has some questions added
    And I login as a normal user

  Scenario: User starts on a survey
    When I visit survey page
    Then I should find participate link