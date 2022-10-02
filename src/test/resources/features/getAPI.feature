@getapicall
Feature: Get API feature

  Scenario: get user detail
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/30'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    
    * def actualName = jsonResponse.name
    * def actualId = jsonResponse.id
    * def actualEmail = jsonResponse.email
    
    * match actualName == 'Shubhaprada Acharya'
    * match actualId == 30
    * match actualEmail == 'acharya_shubhaprada@brekke.name'

  Scenario: get user detail - user not found
    Given url 'https://gorest.co.in'
    And path '/public/v2/users/1'
    When method GET
    Then status 404
    * print response
