require 'selenium-webdriver'

# Specify browser (in this case, Firefox)
driver = Selenium::WebDriver.for :firefox

# Navigate to the page
driver.navigate.to "https://practicetestautomation.com/practice-test-login/"

# Find the username field, enter an incorrect username
username_field = driver.find_element(name: "username")
username_field.send_keys("erroruser")

# Find the password field, enter a valid password
password_field = driver.find_element(name: "password")
password_field.send_keys("Password123")

# Find the Submit button and click it
submit_button = driver.find_element(id: "submit")
submit_button.click

# Verify error message is displayed
error_message = driver.find_element(id: "error")
if error_message.displayed?
  puts "Test1 Passed - Error message is displayed"
else
  puts "Error message is not displayed."
end

# Verify error message text is "Your username is invalid!"
expected_error_message = "Your username is invalid!"
actual_error_message = error_message.text
if actual_error_message == expected_error_message
  puts "Test2 Passed - Error message text is correct"
else
  puts "Error message text is incorrect. Expected '#{expected_error_message}', but got '#{actual_error_message}'."
end

# Quit the browser
driver.quit
