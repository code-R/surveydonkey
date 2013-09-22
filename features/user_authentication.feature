Feature: User Authentication
  In order to get access to protected sections of the site
  A user
  Should be able to register and login

  Scenario: User is not registered
    Given There is no user
    When I sign in with valid email and password
    Then I see an error message
    And I should be in login page