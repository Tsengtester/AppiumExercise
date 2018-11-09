Given /^I agree terms$/ do
    $driver.find_element(:xpath, $element_table['agreeTermsBtn']).click
end

When /^I retrieve wallet$/ do
    $driver.find_element(id:$element_table['retrieveWalletBtn']).click
    sleep(2)
end

When /^Retrieve By keyStore$/ do
    $driver.find_element(id:$element_table['keystoreBtn']).click
    $driver.find_element(:xpath, $element_table['keystoreTextFiled']).send_keys($keystore)
    $driver.hide_keyboard
    sleep(2)
    $driver.find_element(id:$element_table['confirmBtn']).click
    sleep(2)
end

And /^Check keyStore Password$/ do
    is_element_displayed(:xpath, $element_table['confirmPwDialog'])
    sleep(2)
    $driver.find_element(:xpath, $element_table['inputPwTextFiled']).send_keys("test0003")
    sleep(2)
    $driver.find_element(id: $element_table['confirmBtnOfPwDialog']).click
    sleep(2)
end

Then /^I should see Wallet Ready message$/ do 
    is_element_displayed("id", $element_table['walletReadyText'])
end

When /^I skip the PIN Setting$/ do
    $driver.find_element(id: $element_table['PinSkipBtn']).click
end

Then /^I should see Set Name Text$/ do
    $driver.find_element(id: $element_table['SetNameText']).displayed?
end

Given /^I choose to setting the wallet name$/ do
    $driver.find_element(id: $element_table['SetNameSettingBtn']).click
end

When /^user change the wallet name and submit$/ do
    $driver.find_element(:xpath, $element_table['WalletNameEdit']).clear
    $driver.find_element(:xpath, $element_table['WalletNameEdit']).send_keys("QAWallet")
    $driver.hide_keyboard
    sleep(2)
    $driver.find_element(id: $element_table['WalletNameConfirm']).click
    sleep(2)
    #$driver.find_element(:xpath, $element_table['WalletIcon']).click
end

Given /^I choose to retrieve more wallet$/ do
    $driver.find_element(:xpath, $element_table['WalletIcon']).click
    $driver.find_element(:xpath, $element_table['ImportWalletIN']).click
    sleep(2)
end

Given /^I choose to add Token Currency$/ do
    $driver.find_element(:xpath, $element_table['AddCurrency']).click
end

When /^User Add TWX Currency$/ do
    $driver.find_elements(class: $element_table['TWXSwitch'])[1].click
    $driver.find_element(id: $element_table['Back']).click
end


Given /^I choose to send TWX$/ do
    $driver.find_element(id: $element_table['Transaction']).click
    sleep(3)
    $driver.find_element(id: $element_table['Send']).click
    sleep(3)
end

When /^User Send TWX$/ do
    $driver.find_element(:xpath, $element_table['SendAddress']).send_keys("0x417353BF6AB7bdb47461F06E589C22422A2fCA59")
    sleep(1)
    $driver.find_element(:xpath, $element_table['SendAmounts']).send_keys("3")
    sleep(1)
    $driver.find_element(id: $element_table['Back']).click
    sleep(1)
    $driver.find_element(id: $element_table['Property']).click
    #$driver.find_element(id: $element_table['SendNextBtn']).click
    sleep(2)
    #$driver.find_element(id: $element_table['SendConfirmBtn']).click
end

When /^Retrieve By Mnemonic$/ do
    $driver.find_element(id: $element_table['ImportMnemonicBtn']).click
    sleep(3)
    $driver.find_element(:xpath, $element_table['Mnemonic']).send_keys("camp spike help need alcohol silk divert ready chat february nuclear trigger")
    sleep(3)
    $driver.find_element(:xpath, $element_table['SettingNewPassword']).send_keys("Test123456Test123qa12")
    sleep(3)
    $driver.find_element(:xpath, $element_table['RepeatNewPassword']).send_keys("Test123456Test123qa12")
    sleep(3)
    $driver.hide_keyboard
    $driver.find_element(id: $element_table['ImportConfirmBtn']).click
    sleep(3)
    
end

Then(/^the element having (.+) "([^\"]*)" should\s*((?:not)?)\s+have text as "(.*?)"$/) do |type, access_name, present, value |
    #data="title"
    #puts data
    access_name = $element_table[access_name]
    validate_locator type
    check_element_text(type, value, access_name, present.empty?)
end