#require selenium-webdriver gem
require 'selenium-webdriver'

#launch the chrome browser
driver=Selenium::WebDriver.for:chrome 

#maximize the window
driver.manage.window.maximize

#navigate to the website
driver.get "https://elm1403-test.zenoss.io/#/"

#find the username textbox element
username=driver.find_element(:name,"username")

#type the username dIadmin@elm1403-test.com
username.send_keys("admin@elm1403-test.com")


#press continue
action=driver.find_element(:name,"action")
action.click


#find the password textbox element
password=driver.find_element(:name,"password")

#type the password D0gP0und!
password.send_keys("D0gP0und!")


#press continue
action=driver.find_element(:name,"action")
action.click

sleep 5

driver.find_element(:xpath,"//*[@id='app']/div[3]/div/div/div[3]/button").click

sleep 5
