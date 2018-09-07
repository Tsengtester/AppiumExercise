When /^I retrieve wallet$/ do
    $driver.find_element(id:$element_table['retrieveWalletBtn']).click
end

Given /^I agree terms$/ do
    $driver.find_element(id: $element_table['agreeTermsBtn']).click
end

When /^Retrieve By keyStore$/ do
    $driver.find_element(id:$element_table['ImportKeystoreBtn']).click
    sleep(3)
    #$driver.find_element(id:$element_table['keystoreTextFiled']).send_keys($keystore)
    $driver.find_element(id:$element_table['keystoreTextFiled']).send_keys("{\"address\":\"a3b77ff951cd9e1af4f51470b67fd1e0fc1c2b63\",\"crypto\":{\"cipher\":\"aes-128-ctr\",\"ciphertext\":\"6eb1cb3ecb62de3d74743aa1a85b4440cb51e0288b1cb827f1894c83a2dcd3be\",\"cipherparams\":{\"iv\":\"33c18a431d7b47b2394b2e6a9d0f484e\"},\"kdf\":\"scrypt\",\"kdfparams\":{\"dklen\":32,\"n\":4096,\"p\":6,\"r\":8,\"salt\":\"e23d0b3d4d46eb626162d040662dfe9604d6ad550e1bf63262ae666aa94bb062\"},\"mac\":\"e4db9b68d391805abf2b0d67ccf03b47406c9c464259799748f27ced40a12ed1\"},\"id\":\"d31c84a1-c985-4dd7-bfca-94acd7bea7ce\",\"version\":3}")
    sleep(3)
    $driver.find_element(id:$element_table['confirmBtn']).click
    sleep(3)
end

And /^Check keyStore Password$/ do
    is_element_displayed("id", $element_table['confirmPwDialog'])
    sleep(3)
    $driver.find_element(class: $element_table['inputPwTextFiled']).send_keys("test0003")
    sleep(3)
    $driver.find_element(id: $element_table['confirmBtnOfPwDialog']).click
    sleep(3)
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
    $driver.find_element(id: $element_table['WalletNameEdit']).clear
    $driver.find_element(id: $element_table['WalletNameEdit']).send_keys("QAWallet")
    $driver.find_element(id: $element_table['WalletNameConfirm']).click
end

Given /^I choose to add Token Currency$/ do
    $driver.find_element(id: $element_table['AddCurrency']).click
end

When /^User Add TWX Currency$/ do
    $driver.find_elements(class: $element_table['TWXSwitch'])[1].click
    $driver.find_element(:xpath, $element_table['Back']).click
end

Given /^I choose to send TWX$/ do
    $driver.find_element(:xpath, $element_table['TWX']).click
    sleep(3)
    $driver.find_element(id: $element_table['Send']).click
    sleep(3)
end

When /^User Send TWX$/ do
    $driver.find_element(id: $element_table['SendAddress']).send_keys("0x417353BF6AB7bdb47461F06E589C22422A2fCA59")
    sleep(1)
    $driver.find_element(id: $element_table['SendAmounts']).send_keys("3")
    sleep(1)
    $driver.find_element(id: $element_table['SendNextBtn']).click
    sleep(2)
    $driver.find_element(id: $element_table['SendConfirmBtn']).click
end

Given /^I choose to retrieve more wallet$/ do
    $driver.find_element(id: $element_table['WalletIcon']).click
    $driver.find_element(id: $element_table['ImportWalletIN']).click
end

When /^Retrieve By Mnemonic$/ do
    $driver.find_element(id: $element_table['ImportMnemonicBtn']).click
    sleep(3)
    $driver.find_element(id: $element_table['Mnemonic']).send_keys("camp spike help need alcohol silk divert ready chat february nuclear trigger")
    sleep(3)
    $driver.find_element(:xpath,$element_table['SettingNewPassword']).send_keys("Test123456Test")
    sleep(3)
    $driver.find_element(:xpath,$element_table['RepeatNewPassword'] ).send_keys("Test123456Test")
    sleep(3)
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





     
