Feature: Create user using post api

Background:
	* url 'https://gorest.co.in'
	* def requestPayload = read('classpath:payload/user.json')
	
Scenario: Create a user with the given data
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'Ali'
And match $.data.email == 'ali97@gmail.com'