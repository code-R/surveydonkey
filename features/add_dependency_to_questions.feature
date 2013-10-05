Feature: Add dependent questions
  In order to create set of similar questions
  As an admin
  I should be able to set dependency while adding questions

  Scenario: Admin see list of questions to set as a parent
    Given I login as admin
    And There is a survey
    And Survey has some questions added
    When I visit question new page
    Then I should see questions select box

  Scenario: Admin sets a question as paren
    Given I login as admin
    And There is a survey
    And Survey has some questions added
    When I visit question new page
    And I select some question as a parent
    And I click "Create Question"
    Then I should see parent information under the question