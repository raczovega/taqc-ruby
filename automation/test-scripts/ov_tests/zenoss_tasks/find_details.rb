def find_details(driver)
    #click on explore cz
    element_cz = driver.find_element(:xpath,"//*[@id='app']/div/header/div/div/a[7]").click
  
    #click on qa-ubuntu-14 device
    device_element = driver.find_element(:xpath,"//*[@id='gridview-1079']/table/tbody/tr[33]/td[1]/div/a").click
    driver.manage.timeouts.implicit_wait = 5 # timeout for the driver to wait for an element
   
    #Select HardDisks
    components_hd = driver.find_element(:xpath, "//*[@id='treeview-1309']/table/tbody/tr[8]/td/div/span").click
    driver.manage.timeouts.implicit_wait = 5 # timeout for the driver to wait for an element
  
    #Select HD from list
    lists_hd = driver.find_element(:css, "tr.x-grid-row-alt:nth-child(13)")
    driver.manage.timeouts.implicit_wait = 5 # timeout for the driver to wait for an element
  
    #Find details
    dropdown_menu = driver.find_element(:xpath,"//*[@id='detailnavcombo-1344-triggerWrap']").click
    driver.manage.timeouts.implicit_wait = 5 # timeout for the driver to wait for an element
  
    dropdown_item = driver.find_element(:css, 'li.x-boundlist-item:nth-child(3)').click
  
    element = driver.find_element(:css, "#contextcardpanel-1341-body")
    divs = element.find_elements(:css, "div")
    divs.each do |div|
    puts div.text.strip
    end
  end
 