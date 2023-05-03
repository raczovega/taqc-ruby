require 'httparty'
require 'json'

api_key = '186df75254abbb9b71cc7c152085ddef'

def get_weather(api_key, city)
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
    response = HTTParty.get(url)

  if response.code == 200
    parsed_response = JSON.parse(response.body)
    temperature = parsed_response['main']['temp']
    description = parsed_response['weather'][0]['description']
    return { temperature: temperature, description: description }
  else
    return nil
  end
end

city = 'Berlin'
weather = get_weather(api_key, city)

if weather.nil?
  puts "Failed to retrieve weather for #{city}."
else
  puts "Current weather in:"
  puts "Temperature: #{weather[:temperature]}°C"
  puts "Description: #{weather[:description]}"
end
