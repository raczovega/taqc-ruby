require "selenium-webdriver"
require_relative 'login'

# Create a new Firefox browser instance
driver = Selenium::WebDriver.for :firefox

# Login using the login function from the login.rb file
login(driver)

driver.manage.timeouts.implicit_wait = 10

#click on qa-ubuntu-14 device
#driver.find_element(:xpath,"//*[@id='gridview-1079']/table/tbody/tr[20]/td[1]/div/a").click
sleep 3

#device menu table
production_state_dropdown=driver.find_element(:xpath, "//*[@id='treeview-1309']/table")

#options to select
production_state_dropdown_options=production_state_dropdown.find_elements(:tag_name,'tr')

#select the component "File system"
production_state_dropdown_options.each{|state| state.click if state.text.include? "Hard Disks"}

sleep 5
=begin
# Find the parent element
parent_element = driver.find_element(:css, "#ext-gen1835 > td:nth-child(1) > div:nth-child(1)")

# Find the child element inside the parent element
child_element = parent_element.find_element(:css, "tr.x-grid-tree-node-leaf:nth-child(8) > td:nth-child(1) > div:nth-child(1)")

# Click on the child element
child_element.click()
=end
# Close the browser window
#driver.quit
