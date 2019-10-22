Given("an API to check the weather") do
  puts "INICIANDO FLUXO"
end

When("I search for the city by its name") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&q=Sao Paulo')
end

When("I search for the city by its ID") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&id=3448439')
end


When("I search for the city by its geographic coordinates") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&lat=-23.547501&lon=-46.636108')
end

When("I search for the city with a wrong name") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=5bd636568911b186f0a3c64de0751b65&q=Lonon')
end

When("I search for the city with a invalid access key") do
  @result = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?APPID=124&q=Sao Paulo')
end


Then("the HTTP response must contain the message {string}") do |message|
  expect(@result.parsed_response['message']).to eql message
end


Then("the HTTP response should be {string}") do |status_code|
  expect(@result.response.code).to eql status_code
end

Then("the HTTP response must contain the city's name") do
  expect(@result.parsed_response['name']).to eql "Sao Paulo"
end


