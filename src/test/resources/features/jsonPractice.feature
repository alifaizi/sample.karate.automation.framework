Feature: practice with json file

  Scenario: creating a json type data
  
    * def myJsonData =
      """
      [
      
      {
      "id" : "101",
      "name" : "Ali",
      "city" : "Alexandria" 
      },
      
      {
      "id" : "102",
      "name" : "Faizi",
      "city" : "Falls Church" 
      },
      
      {
      "id" : "103",
      "name" : "Sarah",
      "city" : "Springfield" 
      }
      
      ]
      """
    * print myJsonData
    * print myJsonData[0]
    * print myJsonData[1]
    * print myJsonData[2]
    * print myJsonData[0].id
    * print myJsonData[1].city
    * print myJsonData[2].name
    
    * def fullObjectDataConcatenated = "ID: " + myJsonData[0].id + ", " + "Name: " + myJsonData[0].name + ", " + "City: " + myJsonData[0].city
    * print fullObjectDataConcatenated
