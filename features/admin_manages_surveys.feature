Feature: Survey Management
  In order to participate in surveys
  As a User
  Admin should be able to manage surveys

  Background:
    Given I login as admin

  Scenario: Admin adds a survey
    When I visit survey create page
    And fill in survey information
    And I click "Create Survey"
    Then I should see "Survey was successfully created."
    And survey should be added

  Scenario: Admin updates survey
    Given There is a survey
    When I visit survey page as admin
    And I click "Edit"
    And update survey information
    And I click "Update Survey"
    And I should see "Survey was successfully updated."

  Scenario: Admin deletes survey
    Given There is a survey
    When I visit survey list page
    And I click "Destroy"
    And I should see "Survey was successfully destroyed."