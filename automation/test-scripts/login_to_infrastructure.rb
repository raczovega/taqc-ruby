def login_to_infrastructure(driver)

#maximize the window
driver.manage.window.maximize
#options.add_experimental_option('excludeSwitches', ['enable-logging'])

#navigate to the website
driver.get "https://elm1403-test.zenoss.io/#/"
    
#find the username textbox element
username=driver.find_element(:name,"username")
    
#type the username dIadmin@elm1403-test.com
username.send_keys("admin@elm1403-test.com")
    
#press continue
action=driver.find_element(:name,"action").click
    
#find the password textbox element
password=driver.find_element(:name,"password")
    
#type the password D0gP0und!
password.send_keys("D0gP0und!")
    
#press continue
action=driver.find_element(:name,"action").click
    
sleep 3

#click okay. ONLY ACTIVATE WHEN EMERGENT WINDOW APPEAR
#driver.find_element(:xpath,"//*[@id='app']/div[3]/div/div/div[3]/button").click

#click on explore cz
driver.find_element(:xpath,"//*[@id='app']/div/header/div/div/a[7]").click

sleep 3

end