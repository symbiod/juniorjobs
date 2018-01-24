Feature: create vacancy
  I create the vacancy

  Background:
    Given I am on the juniorjobs home page

  Scenario: create job with valid data
    Given user click add_vacancy
    Then user redirect to new_vacancy page
    When user fill form with valid data
    And user click submit
    Then user redirect to home page
    And user see his vacancy