Feature: GET API with query parameter

Scenario: Get all active users
* def queryParam = {status: 'active', gender: 'male', id:2662}
Given url 'https://gorest.co.in'
And path '/public/v2/users'
And params queryParam
When method GET
Then status 200
* print response

Scenario: Get all active users
* def queryParam = {status: 'active'}
Given url 'https://gorest.co.in'
And path '/public/v2/users'
And params queryParam
When method GET
Then status 200
* def jsonResponse = response
* print jsonResponse
* def userCount = jsonResponse.data.length
* print userCount
* match userCount == 21