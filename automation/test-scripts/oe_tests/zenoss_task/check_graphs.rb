def check_graphs(driver)
    wait = Selenium::WebDriver::Wait.new(timeout: 3)

    containers = driver.find_elements(:css, '[id^="container-"]')

    containers.each do |container|
        rows = container.find_elements(class: "zenfooter_value_row")

        rows.each do |row|
            puts row.text
        end
    end
end