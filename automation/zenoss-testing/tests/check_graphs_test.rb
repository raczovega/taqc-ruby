def check_graphs(driver)
  wait = Selenium::WebDriver::Wait.new(timeout: 3)

  sleep 3
  production_state_dropdown=driver.find_element(:xpath, "//*[@id='treeview-1309']/table")

  production_state_dropdown_options=production_state_dropdown.find_elements(:tag_name,'tr')

  production_state_dropdown_options.each { |state| state.click if state.text == "Graphs" }
  
  sleep 3

  containers = driver.find_elements(:css, '[id^="container-"]')

  found_no_data = false

  containers.each do |container|
      rows = container.find_elements(class: "zenfooter_value_row")

      rows.each do |row|
          cells = row.find_elements(tag_name: 'td')
          cells.each do |cell|
            if cell.text.include?('N/A')
              puts "Found row: #{row.text}"
              found_no_data = true
              break
            end
          end
      end
  end
  
  if !found_no_data
    puts "Complete data in graphs"
  end
end