Feature: Current Weather data

  Scenario Outline: Checking the current weather
    Given an API to check the weather  
    When I search for the "<type>" with "<value>"
    Then the HTTP response should be "200"
    And the HTTP response must contain the city's name and the weather's information
    
    Examples:
      |type   |value      |
      |q      |Sao Paulo  |
      |id     |3448439    |
  
  Scenario: Checking the current weather
    Given an API to check the weather  
    When I search for the "-23.55" and "-46.64"
    Then the HTTP response should be "200"
    And the HTTP response must contain the city's name and the weather's information

    Scenario Outline: Negative tests
    Given an API to check the weather  
    When I search for the "<type>" with "<value>"
    Then the HTTP response should be "<status_code>"
    And the HTTP response must contain the error "<message>" 
    
    Examples:
      |type   |value   |status_code  |message             |
      |q      |        |400          |Nothing to geocode  |
      |q      |3448439 |404          |city not found      |

  Scenario: Invalid Access Key
    Given an API to check the weather 
    When I search for the city with a invalid access key
    Then the HTTP response should be "401"
    And the HTTP response must contain the error "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."


