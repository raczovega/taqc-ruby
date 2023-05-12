def production_state(driver)
    #open production state selector
    selector=driver.find_element(:xpath,"//*[@id='production-state-combo-triggerWrap']")
    selector.click

    #production state table
    production_state_dropdown=driver.find_element(:xpath, "//*[@id='boundlist-1408-listEl']")

    #production state options to select
    production_state_dropdown_options=production_state_dropdown.find_elements(:tag_name,'li')

    #production state options (array)
    state_option=[]
    production_state_dropdown_options.each do |state| 
        state_option<<state.text
    end

    j = state_option.size
    i = 0
    while i < j
        #select production state
        production_state_dropdown_options[i].click

        #click on "save"
        driver.find_element(:xpath,"//*[@id='button-1318-btnInnerEl']").click
        sleep 2

        #verify that the production state has been set
        production_state_text=driver.find_element(:xpath,"//*[@id='tbtext-1360']")

        if production_state_text.text==state_option[i]
            puts "#{state_option[i]} was set correctly"
        else
            puts "#{state_option[i]} was not set correctly"
        end

        i+=1
        selector.click
    end
end