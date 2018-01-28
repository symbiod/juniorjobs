Feature: create vacancy
  I create the vacancy

  Background:
    Given I am on the juniorjobs home page
    Given user click add_vacancy
    Then user redirect to new_vacancy page

  Scenario: create job with valid data
    When user fill vacancy form
    And user click submit
    Then user redirect to home page
    # pending => Add premoderation
    And user see his vacancy

  Scenario: create job with blank title
    Given user have vacancy with blank title
    When user fill vacancy form
    And user click submit
    Then user see vacancy form
    And user see error message: "недостаточной длины (не может быть меньше 5 символа)"
