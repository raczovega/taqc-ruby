require 'selenium-webdriver'

class DeviceUtils
    def self.login(driver)
        driver.manage.window.maximize
        
        driver.get "https://elm1403-test.zenoss.io/#/"
            
        username=driver.find_element(:name,"username")
            
        username.send_keys("admin@elm1403-test.com")
    
        action=driver.find_element(:name,"action").click
            
        password=driver.find_element(:name,"password")
            
        password.send_keys("D0gP0und!")
    
        action=driver.find_element(:name,"action").click
    end
    def self.select_device(driver, device_path)
        sleep 3
        #click okay if find any issue in login
        too_many_users = driver.find_elements(:xpath, "//*[@id='app']/div[3]/div/div/div[3]/button")
    
        #click okay if find any issue in dashboard
        if too_many_users.any?
            too_many_users.first.click
        end

        #click on explore cz
        driver.find_element(:xpath,"//*[@id='app']/div/header/div/div/a[7]").click

        sleep 3
        #click on device
        driver.find_element(:xpath, device_path).click

        sleep 3
    end
    def self.return_to_dashboard(driver)
        driver.get "https://elm1403-test.zenoss.io/#/"
        sleep 3
    end
end