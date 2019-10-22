Given("an API to check the weather") do
  puts "Starting tests"
end

When("I search for the {string} with {string}") do |type, value|
  @url = "https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&#{type}=#{value}"
  @result = HTTParty.get(@url)
  
end

Then("the HTTP response should be {string}") do |status_code|
  expect(@result.response.code).to eql status_code
end

Then("the HTTP response must contain the city's name and the weather's information") do
  expect(@result.parsed_response['name']).to eql "Sao Paulo"
  expect(@result.parsed_response['weather'].to_s).to include ("description")
  expect(@result.parsed_response['weather'].to_s).to include ("id")
  expect(@result.parsed_response['weather'].to_s).to include ("main")
  expect(@result.parsed_response['weather'].to_s).to include ("icon")
end


When("I search for the {string} and {string}") do |latitude, longitude|
  @url = "https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&lat=#{latitude}&lon=#{longitude}"
  @result = HTTParty.get(@url)

end

When("I search for the city with a invalid access key") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=124&q=Sao Paulo')
end

Then("the HTTP response must contain the error {string}") do |message|
  expect(@result.parsed_response['message']).to eql message
end





