require "selenium-webdriver"

# Create a new Firefox browser instance
driver = Selenium::WebDriver.for :firefox

# Navigate to the login page
driver.navigate.to "https://elm1403-test.zenoss.io/cz0/zport/dmd/Devices/Server/SSH/Linux/devices/10.88.120.112/devicedetail#deviceDetailNav:device_overview"

# Find the username and password fields and enter the login information
driver.find_element(name: "username").send_keys("admin@elm1403-test.com")

# Click the first continue button
submit_button = driver.find_element(name: "action").click()

#Enter Password and Confirm
driver.find_element(name: "password").send_keys("D0gP0und!")
submit_button = driver.find_element(name: "action").click()

# Wait for the page to load
wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.execute_script("return document.readyState") == "complete" }

# locate the dropdown menu element
drop_down = driver.find_element(:xpath, "//div[contains(@class, 'x-grid-cell-inner') and contains(text(), 'Hard Disks')]")

# click on the dropdown menu to expand it
drop_down.click()

# locate the elements inside the dropdown menu
elements = drop_down.find_elements(:xpath, ".//*")

# print the elements found inside the dropdown menu
elements.each do |element|
  puts element.attribute("class")
end

# Close the browser window
driver.quit
