require 'selenium-webdriver'
require 'yaml'

require_relative './utils/device_utils'
Dir['./tests/*.rb'].each { |file| require file }

devices = YAML.load_file('config/devices.yaml')['devices']

driver = Selenium::WebDriver.for:firefox 

# Loop through devices and run tests
DeviceUtils.login(driver)

devices.each do |device|
    puts "Device: #{device['name']}"
    puts "Escenario: #{device['case_escenario']}"
    DeviceUtils.select_device(driver, device['path'])
    method(device['case_escenario']).call(driver)
    DeviceUtils.return_to_dashboard(driver)
    puts "Test Finished"
end