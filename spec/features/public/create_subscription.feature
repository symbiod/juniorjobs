Feature: create subscription
  User subscribes

  Background:
    Given User on the juniorjobs home page
    Given User subscribes    

  Scenario: Subscribe with valid email
    When User fill subscriptions form and submit
    Then User see message: "Выполнено успешно"

  Scenario Outline: create subscription with not valid data
    Given User have subscription <field> with <data>
    When User fill subscriptions form and submit
    Then User see message: <message>

    Examples:
    | field  | data      | message                   |
    | email  | invalid   | "имеет неверное значение" |
    | email  |           | "не может быть пустым"    |
