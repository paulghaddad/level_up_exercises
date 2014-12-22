Feature: User Accounts
  As a user
  I want to sign into my account
  In order to manage my personal list of artists and artworks

  Background:
    Given I am a user

  Scenario: User signs in
    Given I am on the homepage
    When I log in to my account
    Then I should be on my user page
    And I should see a message confirming I am logged in
