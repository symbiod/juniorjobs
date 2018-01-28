Feature: display vacancies

  Background:
    Given I am on the juniorjobs home page
    Given default vacancies exist

  Scenario: display vacancies list
    Then user see vacancy list

  Scenario: display vacancies body
