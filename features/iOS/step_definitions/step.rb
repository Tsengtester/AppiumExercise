Given /^I agree terms$/ do
    $driver.find_element(id: $element_table['agreeTermsBtn']).click
end

When /^I retrieve wallet$/ do
    $driver.find_element(id:$element_table['retrieveWalletBtn']).click
    $driver.find_element(id:$element_table['keystoreBtn']).click
    $driver.find_element(id:$element_table['keystoreTextFiled']).send_keys($keystore)
    sleep(10)
    $driver.find_element(id:$element_table['confirmBtn']).click

    is_element_displayed("id", $element_table['confirmPwDialog'])
    
    $driver.find_element(class: $element_table['inputPwTextFiled']).send_keys("esthertsia")
    sleep(30)
    $driver.find_element(id: $element_table['confirmBtnOfPwDialog']).click
end

Then /^I should see Wallet Ready message$/ do 
    is_element_displayed("id", $element_table['walletReadyText'])
end