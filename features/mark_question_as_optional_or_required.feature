Feature: Admin marks question as optional or required
  In order to make question answers as required or optional
  As an admin
  I should be able to mark question as optional or required

  Scenario Outline: Admin should mark as required or optional for a question
    Given I login as admin
    And There is a survey
    When I visit survey page as admin
    And I click "Add Question"
    And I fill in "Date" Question details
    And I "<action>" question as required
    And I click "Create Question"
    Then I should see question as "<question_status>" in the questions page

  Examples:
    |question_status| action  |
    | Required      | check   |
    | Optional      | uncheck |

  Scenario: Admin should mark as required or optional for a question
    Given There is a survey
    And Survey has a "date" Question
    And the question status is set as optional
    When I login as a normal user
    And I visit survey page
    And I click "Participate"
    And I click "Submit"
    Then I should see "Survey is completed."