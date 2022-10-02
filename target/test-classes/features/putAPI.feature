Feature: Create user using post api

Background:
	* url 'https://gorest.co.in'
	* def requestPayload = 
	"""
	{
        "status": "inactive"
    }
	
	"""
Scenario: Create a user with the given data
Given path '/public/v1/users/2610'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'Shakuntala Gowda'
And match $.data.email == 'shakuntala_gowda@bernhard.com'