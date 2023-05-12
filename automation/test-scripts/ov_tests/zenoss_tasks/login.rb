#require "selenium-webdriver"
#driver = Selenium::WebDriver.for :firefox

def login(driver)
  # Navigate to the login page
  driver.navigate.to "https://elm1403-test.zenoss.io/#/"

  # Find the username and password fields and enter the login information
  driver.find_element(name: "username").send_keys("admin@elm1403-test.com")
  submit_button = driver.find_element(name: "action").click()

  # Enter Password and Confirm
  driver.find_element(name: "password").send_keys("D0gP0und!")
  submit_button = driver.find_element(name: "action").click()
end

#driver.quit