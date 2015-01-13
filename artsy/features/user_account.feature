Feature: User Accounts
  As a user
  I want to create an account on the site
  In order to use the site

  Scenario: User signs up
    Given I am on the homepage
    When I signup as a user
    Then I should be on my user page
    And I should see a message confirming the user was created

  Scenario: User signs in with invalid info
    Given I am on the homepage
    When I signup as a user with invalid data
    Then I should see user validation errors

  Scenario: View the index of users
    Given I have 2 users
    And I am logged in
    And I am on the users page
    Then I should see all the users

  Scenario: View an individual user
    Given I am logged in
    And I am on the page for a user
    Then I should see the user's information

  Scenario: Update a user with valid attributes
    When I edit a user with valid data
    Then I should see the updated name
    And I should see a message confirming the user was updated

  Scenario: Update a user with invalid attributes
    When I edit an user with invalid data
    Then I should see user validation errors

  Scenario: Delete user
    When I delete a user
    Then I should not see the user on the Users page
    And I should see a message confirming the user was deleted