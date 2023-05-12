require 'uri'
require 'net/http'
require 'json'

url = URI("https://forecast9.p.rapidapi.com/rapidapi/forecast/Berlin/hourly/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'e582cf00c1msh9ba11bc11689379p1598acjsnd135dd389cd1'
request["X-RapidAPI-Host"] = 'forecast9.p.rapidapi.com'

response = http.request(request)

if response.code == "200"
  result = JSON.parse(response.read_body)
  File.open("json/forecast.json", "w") { |file| file.write(JSON.pretty_generate(result)) }
else
  puts "Error: Unable to retrieve weather data. Code: #{response.code}"
end
