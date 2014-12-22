Feature: User Authentication
  As a user
  I want to login to the site
  In order to manage my personal list of artists and artworks

  Scenario: User signs up
    Given I am on the homepage
    When I signup as a user
    Then I should be on my user page
    And I should see a message confirming the user was created

  Scenario: User signs in with invalid info
    Given I am on the homepage
    When I signup as a user with invalid data
    Then I should see user validation errors
