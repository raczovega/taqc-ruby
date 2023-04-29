require 'selenium-webdriver'

# set up the Firefox driver
driver = Selenium::WebDriver.for :firefox

# navigate to the website
driver.navigate.to "https://elm1403-test.zenoss.io/cz0/zport/dmd/Devices/Server/SSH/Linux/devices/10.88.120.112/devicedetail#deviceDetailNav:device_overview"

# Wait for the page to load
wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.execute_script("return document.readyState") == "complete" }

# Get the root HTML element
root_element = driver.find_element(tag_name: 'html')

# Find the username and password fields and enter the login information
driver.find_element(name: "username").send_keys("admin@elm1403-test.com")

# Click the first continue button
submit_button = driver.find_element(name: "action").click()

#Enter Password and Confirm
driver.find_element(name: "password").send_keys("D0gP0und!")
submit_button = driver.find_element(name: "action").click()

# Define a recursive function to output the properties of all child elements
def output_element_properties(element, indent_level)
    # Output the element tag name and attributes
    puts "#{' ' * indent_level}<#{element.tag_name}>"
    element.attribute_names.each do |attr_name|
      puts "#{' ' * (indent_level + 2)}#{attr_name}: #{element.attribute(attr_name)}"
    end
  
    # Recursively output the properties of all child elements
    element.find_elements(tag_name: '*').each do |child_element|
      output_element_properties(child_element, indent_level + 2)
    end
  end
  
  # Output the properties of all child elements of the root HTML element
  output_element_properties(root_element, 0)
  
# quit the driver
#driver.quit
