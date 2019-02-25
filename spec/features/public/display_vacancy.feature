Feature: display once vacancy and list

  Scenario: display list vacancies
    Given 10 default approved vacancies exists
    When I am on the juniorjobs home page
    Then user see jobs list

  Scenario: display vacancy on vacancy page
    Given default approved vacancy exists
    When I am on the juniorjobs home page
    And user click job_title
    Then user redirect to vacancy page
    And user see vacancy
