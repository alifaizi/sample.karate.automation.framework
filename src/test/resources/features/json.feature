Feature: Json feature testing

  Scenario: json reader parser
    * def jsonObject =
      """
      [
      {
      "name" : "Tom",
      "city" : "Alexandria",
      "age" : "36"
      },
      
      {
      "name" : "Peter",
      "city" : "Arlington",
      "age" : "25"
      }
      ]
      """
    # prints both objects in the array
    * print jsonObject
    # Prints the first set of object
    * print jsonObject[0]
    # prints only name from the first object
    * print jsonObject[0].name
    # prints the second object in one line
    * print jsonObject[1].name+ " " + jsonObject[1].city + " " + jsonObject[1].age

  Scenario: complex json reader
    * def jsonObject =
      """
       {"menu": 
      {
        "id": "file",
      	"value": "File",
      	"popup": 
      {
      	"menuitem": 
      [
        {"value": "New", "onclick": "CreateNewDoc()"},
        {"value": "Open", "onclick": "OpenDoc()"},
        {"value": "Close", "onclick": "CloseDoc()"}
      ]
      }
      }
      }
      """
    * print jsonObject
    * print jsonObject.menu
    * print jsonObject.menu.id
    * print jsonObject.menu.popup
    * print jsonObject.menu.popup.menuitem
    * print jsonObject.menu.popup.menuitem[0].value
    * print jsonObject.menu.popup.menuitem[0].onclick
    
    
