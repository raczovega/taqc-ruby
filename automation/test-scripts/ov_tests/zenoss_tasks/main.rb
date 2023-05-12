require "selenium-webdriver"
require_relative 'login'
require_relative 'find_details'
require "json"

require 'minitest/autorun'

class LoginTest < Minitest::Test
  def setup
    # Create a new Firefox browser instance
    @driver = Selenium::WebDriver.for :firefox
  end

  def teardown
    # Close the browser window
    @driver.quit
  end

  def test_successful_login
    # Call the login method
    login(@driver)

    # Check if the login was successful
    assert_equal("https://elm1403-test.zenoss.io/#/dashboard", @driver.current_url)
    assert(@driver.find_element(class: "dashboard").displayed?)
  end

  def test_failed_login
    # Call the login method with incorrect credentials
    login(@driver)

    # Check if the login failed and the user is still on the login page
    assert_equal("https://elm1403-test.zenoss.io/#/login", @driver.current_url)
    assert(@driver.find_element(class: "login").displayed?)
  end
end
