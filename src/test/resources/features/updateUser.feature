@updatecall
Feature: Update user using put api

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
             "name": "Faizi",
             "gender": "male",
             "status": "active"
         }	
      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Update a user with the given data
  # 1st Call Create a user with post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'

    # Fetch the user id from the post call response
    * def userId = $.data.id
    * print userId

  	# 2nd Put call -- to update the user
  	    * def requestPutPayload =
      """
      {
             "gender": "female",
             "status": "inactive"
         }	
      """
  	
    Given path '/public/v1/users/'+userId
    And request requestPutPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.id == userId
    And match $.data.name == '#present'
    And match $.data.name == 'Faizi'
    And match $.data.email == requestPayload.email
