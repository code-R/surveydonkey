Feature: User Authorization
  In order to manage or participate in surveys
  A user
  Should have necessary roles

  Background:
    Given There is a confirmed user

  Scenario: User with normal role can view survey
    Given There is a survey
    When I login as a normal user
    And I visit survey page
    Then I should be able to view the page

  Scenario: User with normal role can't create surveys
    Given There is a survey
    When I login as a normal user
    And I visit survey create page
    Then I should see invalid authorization message

  Scenario: User with admin role can create survey
    When I login as admin
    And I visit survey create page
    Then I should have acess to survey create page

  Scenario: User with normal role can't view edit and delete links on surveys
    Given There is a survey
    When I login as a normal user
    And I visit survey list page
    Then I should not see edit and destroy links

  Scenario: User with admin role can see edit and delete links on survey
    Given There is a survey
    When I login as admin
    And I visit survey list page
    Then I should see edit and destroy links

  Scenario: User with admin role can't see new survey link
    Given I visit home page
    Then I should not see add survey link

  Scenario: User with normal role can't view edit and delete links on survey page
    Given There is a survey
    When I login as a normal user
    And I visit survey page
    Then I should not see edit and destroy links

  Scenario: User with admin role can view edit and delete links on survey page
    Given There is a survey
    When I login as admin
    And I visit survey page
    Then I should see edit and destroy links

  Scenario: User with admin role can view list of questions added on survey
    Given There is a survey
    And Survey has some questions added
    When I login as admin
    And I visit survey page
    Then I should see list of Questions

  Scenario: User with normal role can't view list of questions added on survey
    Given There is a survey
    And Survey has some questions added
    When I login as a normal user
    And I visit survey page
    Then I should not see list of Questions
