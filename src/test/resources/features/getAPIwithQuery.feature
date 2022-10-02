Feature: Get API with query parameter

  Scenario: get a specific active user
  # Multiple query parameters
    * def query = {status: 'active', gender: 'male', id: 2841}
    Given url baseUrl + '/public/v2/users'
    And params query
    When method get
    Then status 200
    * print response

    
      Scenario: get all active users
      # Sigle query parameter
    * def query = {status: 'active'}
    Given url baseUrl + '/public/v2/users'
    # Calling the parameter as line below
    And params query
    When method get
    Then status 200
    * def jsonResponse = response
    * print response
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 10