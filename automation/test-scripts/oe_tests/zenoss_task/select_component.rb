def select_component(driver)
    #click okay if find any issue in login
    #driver.find_element(:xpath,"//*[@id='app']/div[3]/div/div/div[3]/button").click

    #click on explore cz
    driver.find_element(:xpath,"//*[@id='app']/div/header/div/div/a[7]").click

    sleep 3
    #click on qa-rhel-7
    driver.find_element(:xpath,"//*[@id='gridview-1079']/table/tbody/tr[28]/td[1]/div/a").click

    sleep 3

    production_state_dropdown=driver.find_element(:xpath, "//*[@id='treeview-1309']/table")

    production_state_dropdown_options=production_state_dropdown.find_elements(:tag_name,'tr')

    production_state_dropdown_options.each { |state| state.click if state.text == "Graphs" }
    
    sleep 5
end