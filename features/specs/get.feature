Feature: Current Weather data

  Scenario: Checking the current weather
    Given an API to check the weather  
    When I search for the city by its name
    Then the HTTP response should be "200"
    And the HTTP response must contain the city's name

  Scenario: Checking the current weather by the city's ID
    Given an API to check the weather 
    When I search for the city by its ID
    Then the HTTP response should be "200"
    And the HTTP response must contain the city's name

  Scenario: Checking the current weather by geographic coordinates
    Given an API to check the weather 
    When I search for the city by its geographic coordinates
    Then the HTTP response should be "200"
    And the HTTP response must contain the city's name

  Scenario: Negative tests 1
    Given an API to check the weather 
    When I search for the city with a wrong name
    Then the HTTP response should be "404"
    And the HTTP response must contain the message "city not found"

  @test
  Scenario: Negative tests 2
    Given an API to check the weather 
    When I search for the city with a invalid access key
    Then the HTTP response should be "401"
    And the HTTP response must contain the message "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."



