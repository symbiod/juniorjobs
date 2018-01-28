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

  Scenario Outline: create job with blank field
    Given user have vacancy with <preposition> <field>
    When user fill vacancy form
    And user click submit
    Then user see vacancy form
    And user see error message: <message>

    Examples:
    | preposition | field           | message                                               |
    | blank       | title           | недостаточной длины (не может быть меньше 5 символа)  |
    | blank       | description     | недостаточной длины (не может быть меньше 10 символа) |
    | blank       | requirements    | не может быть пустым                                  |
    | blank       | company_name    | не может быть пустым                                  |
    | blank       | company_contact | не может быть пустым                                  |
    | blank       | company_email   | не может быть пустым                                  |
