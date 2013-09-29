Feature: Admin views list of responses from users for each survey
  In order to check repsonses of a given survey
  As an admin
  I should be able to view all responses

  Scenario: Admin should see view responses link
    Given There is a survey
    And I login as admin
    When I visit survey list page
    Then I should view view responses link

  Scenario: Admin should see view responses link
    Given There is a survey
    And Survey has some questions added
    And questions has responses
    When I login as admin
    And I visit survey responses page
    Then I should view list of responses