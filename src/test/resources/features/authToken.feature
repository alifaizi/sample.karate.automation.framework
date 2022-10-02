Feature: Get API headers token

  Scenario: get user detail ---->>> Bearer Token Authentication
  #tokenID (generated token) is coming from karate.js
  * print tokenID
    Given header Authentication = 'Bearer ' + tokenID
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/30'
    When method GET
    Then status 200
    * print response
