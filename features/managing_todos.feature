Feature: Managing Todos
  As a user
  I want to manage my todos
  So that I can keep track of my tasks

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Creating a new todo (happy path)
    Given I am on the todos page
    When I click "New Todo"
    And I fill in "Description" with "Buy groceries"
    And I click "Create Todo"
    Then I should see "Todo was successfully created"
    And I should see "Buy groceries"

  Scenario: Creating a todo with empty description (sad path)
    Given I am on the todos page
    When I click "New Todo"
    And I fill in "Description" with ""
    And I click "Create Todo"
    Then I should see "Description can't be blank"
