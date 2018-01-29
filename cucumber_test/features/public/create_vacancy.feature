Feature: create vacancy
  I create the vacancy

  Background:
    Given I am on the juniorjobs home page
    Given user click add_vacancy
    Then user redirect to new_vacancy page

  Scenario Outline:
    Given user have vacancy <field> with <data>
    When user fill vacancy form
    And user click submit
    Then user redirect to home page
    # pending => Add premoderation
    And user see his vacancy

    Examples:
    | field       | data |
    | title       | 5    |
    | title       | 50   |
    | description | 10   |
    | description | 1200 |

  Scenario Outline: create job with not valid data
    Given user have vacancy <field> with <data>
    When user fill vacancy form
    And user click submit
    Then user see vacancy form
    And user see error message: <message>

    Examples:
    | field           | data | message                                                       |
    | title           |      | недостаточной длины (не может быть меньше 5 символа)          |
    | description     |      | недостаточной длины (не может быть меньше 10 символа)         |
    | requirements    |      | не может быть пустым                                          |
    | company_name    |      | не может быть пустым                                          |
    | company_contact |      | не может быть пустым                                          |
    | company_email   |      | не может быть пустым                                          |
    | title           | 4    | недостаточной длины (не может быть меньше 5 символа)          |
    | title           | 51   | слишком большой длины (не может быть больше чем 50 символа)   |
    | description     | 9    | недостаточной длины (не может быть меньше 10 символа)         |
    | description     | 1201 | слишком большой длины (не может быть больше чем 1200 символа) |
