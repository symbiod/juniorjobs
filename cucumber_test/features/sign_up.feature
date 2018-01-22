Feature: JuniorJobs sign up
  In order to use juniorjobs
  As a registered user
  I need to sign up

  Background:
    Given I am on the juniorjobs signUp page

  Scenario: Sign up with valid credentials
    When I fill the sign up form and submit
    Then account should be created and user redirect to home page with success msg "Вы успешно зарегистрировались"

  Scenario: Sign up with blank name
    Given I have credentials without email
    When I fill the sign up form and submit
    And account should not be created and use see signup form