Feature: JuniorJobs sign up
  In order to use juniorjobs
  As a registered user
  I need to sign up

  Background:
    Given I am on the juniorjobs sign_up page

  Scenario: Sign up with valid credentials
    Given I have credentials with all fields
    When I fill the sign up form and submit
    Then user redirect to home page
    Then user see success msg "Вы успешно зарегистрировались"

  Scenario: Sign up with blank name
    Given I have credentials without email
    When I fill the sign up form and submit
    And account should not be created and user see signup form
