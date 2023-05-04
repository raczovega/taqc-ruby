def login(driver)
    driver.manage.window.maximize
        
    driver.get "https://elm1403-test.zenoss.io/#/"
        
    username=driver.find_element(:name,"username")
        
    username.send_keys("admin@elm1403-test.com")

    action=driver.find_element(:name,"action").click
        
    password=driver.find_element(:name,"password")
        
    password.send_keys("D0gP0und!")

    action=driver.find_element(:name,"action").click
end