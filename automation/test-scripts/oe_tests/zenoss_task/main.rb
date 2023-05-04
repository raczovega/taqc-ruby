require 'selenium-webdriver'
require_relative 'login'
require_relative 'select_component'
require_relative 'check_graphs'

driver=Selenium::WebDriver.for:firefox 

login(driver)

sleep 5

select_component(driver)

sleep 5

check_graphs(driver)