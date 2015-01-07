Feature: Home page

  Scenario: Viewing bottles on home page
    Given there's a "Brown" bottle named "Bob"
    When I am on the homepage
    Then I should see "Bob"
