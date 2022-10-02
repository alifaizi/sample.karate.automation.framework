Feature: Delete user using post api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      	function(s){
      		var text = "";
      		var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      		for(var i=0; i<s; i++)
      			text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      			return text;
      	}
      """
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
      """
      {
             "name": "Ali Faizi",
             "gender": "male",
             "status": "active"
         }	
      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Create a user with the given data
    #1. Create a user using post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    # Fetch the user id
    * def userId = $.data.id
    * print userId
    #2. Delete the same user
    Given path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204
    #3. Get same user with same user id
    Given url 'https://gorest.co.in/public/v2/users/' + userId
    When method GET
    Then status 404
    And assert message == 'Resource not found'
    
    
    
    
    
    
    
    
 