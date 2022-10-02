@apiTest
Feature: Post API Test Feature

  Scenario: Creating user detail in the Tek School Insurance app
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request 
    """
    {
    "username": "supervisor",
    "password": "tek_supervisor"
    }
    """
    When method post
    Then status 200
    And print response
    * def generateToken = response.token
    And print generateToken
    * def generator = Java.type('tek.insurance.app.test.data.FakerDataForTekInsuranceApp')
    * def email = generator.getEmail()
    * def phone = generator.getPhoneNumber()
    * def firstname = generator.getFirstName()
    * def lastname = generator.getLastName()
    * def dateofbirth = generator.getDob()
    And print email
    And print phone
    And print firstname
    And print lastname
    And print dateofbirth
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "#(email)", 
      "title": "Mr.", 
      "firstName": "#(firstName)", 
      "lastName": "#(lastName)", 
      "gender": "MALE", 
      "maritalStatus": "MARRIED", 
      "employmentStatus": "Employed", 
      "dateOfBirth": "#(dateOfBirth)", 
      "new": true
      }
      """
    And header Authorization = "Bearer " + generateToken
    When method post
    Then status 201
    * def id = response.id
    * print response
    Then assert response.email == email
    * print response
    * def generator = Java.type('tek.insurance.app.test.data.FakerDataForTekInsuranceApp')
    * def street = generator.getStreet()
    * def city = generator.getCity()
    * def state = generator.getState()
    * def zipCode = generator.getZipCode()
    * def country = generator.getCountry()
    * def countryCode = generator.getCountryCode()
    * print street
    * print state
    * print zipCode
    * print country
    * print countryCode
    Given path '/api/accounts/add-account-address'
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = id
    And request
      """
      {
      "addressType": "#(addressType)",
      "addressLine1": "#(addressLine1)",
      "city": "#(city)",
      "state": "#(state)",
      "postalCode": "#(zipCode)",
      "countryCode": "#(countryCode)",
      "current": true
      }
      """
    When method post
    Then status 201
    * print response
    * def generator = Java.type('tek.insurance.app.test.data.FakerDataForTekInsuranceApp')
    * def phoneNumber = generator.getPhoneNumber()
    * def phoneExtension = generator.getPhoneExtension()
    * print phoneNumber
    * print phoneExtension
    Given path '/api/accounts/add-account-phone'
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = id
    And request
      """
      {
      "phoneNumber": "#(phoneNumber)",
      "phoneExtension": "#(phoneExtension)",
      "phoneTime": "#(phoneTime)",
      "phoneType": "#(phoneType)"
      }
      """
    When method post
    Then status 201
    * print response
    Given path '/api/accounts/add-account-car'
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = id
    And request
      """
      {
      "make": "Toyota",
      "model": "Rav4",
      "year": "2022",
      "licensePlate": "Ali786"
      }
      """
    When method post
    Then status 201
    * print response
