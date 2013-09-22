Feature: User Authorization
  In order to manage or participate in surveys
  A user
  Should have necessary roles

  Background:
    Given There is a confirmed user

  Scenario: User with normal role
    Given There is a survey
    When I sign in with valid email and password
    And I visit survey page
    Then I should be able to view the page

  Scenario: User with normal role
    Given There is a survey
    When I sign in with valid email and password
    And I visit survey create page
    Then I should see invalid authorization message

  Scenario: User with admin role
    When I login as admin
    And I visit survey create page
    Then I should have acess to survey create page