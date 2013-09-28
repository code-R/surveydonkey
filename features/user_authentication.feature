Feature: User Authentication
  In order to get access to protected sections of the site
  A user
  Should be able to register and login

  Background:
    Given I am not logged in

  Scenario: User is not allowed to sign in
    Given There is no user
    When I sign in with valid email and password
    Then I see an error message
    And I should see invalid message

  Scenario: User signs up with valid data
    Given I am not logged in
    When I register with valid email "vamsi@surveydonkey.com"
    Then I should receive confirmation email
    And user account should be created with email "vamsi@surveydonkey.com"

  Scenario: User signs up with invalid email
    Given I am not logged in
    When I register with invalid email
    Then I should see invalid email message

  Scenario: User signs up without password
    When I sign up without a password
    Then I should see a missing password message

  Scenario: User signs up with mismatched password and confirmation
    When I sign up with a mismatched password confirmation
    Then I should see a mismatched password message

  Scenario: User enters wrong email
    When I register with valid email "vamsi@surveydonkey.com"
    And I sign in with a wrong email
    Then I should see invalid message

  Scenario: User enters wrong password
    When I register with valid email "vamsi@surveydonkey.com"
    And I sign in with a wrong password
    Then I should see invalid message

  Scenario: User tries to login with out confirmation
    When I register with valid email "vamsi@surveydonkey.com"
    And I sign in with valid email and password
    Then I should see confirmation_error message

  Scenario: User tries to login after confirmation
    When I register with valid email "vamsi@surveydonkey.com"
    And I confirm the account
    And I sign in with valid email and password
    Then I should see success message