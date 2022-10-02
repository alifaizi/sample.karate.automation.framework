Feature: Get API headers feature

  Scenario: pass the user request with headers ---->>> Option1
    Given header Content-Type = 'application/json; charset=utf-8'
    Given header Connection = 'keep-alive'
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/30'
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers ---->>> Option2
    * def request_headers = {Content-Type: 'application/json; charset=utf-8', Connection: 'keep-alive'}
    Given headers request_headers
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/30'
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers ---->>> Option3
    * configure headers = {Content-Type: 'application/json; charset=utf-8', Connection: 'keep-alive'}
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/30'
    When method GET
    Then status 200
    * print response
