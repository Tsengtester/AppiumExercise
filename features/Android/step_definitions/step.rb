Given /^I agree terms$/ do
    $driver.find_element(id: $element_table['agreeTermsBtn']).click
end

When /^I retrieve wallet$/ do
    $driver.find_element(id:$element_table['retrieveWalletBtn']).click
    sleep(3)
    $driver.find_element(id:$element_table['keystoreBtn']).click
    sleep(3)
    #$driver.find_element(id:$element_table['keystoreTextFiled']).send_keys($keystore)
    $driver.find_element(id:$element_table['keystoreTextFiled']).send_keys("{\"address\":\"a3b77ff951cd9e1af4f51470b67fd1e0fc1c2b63\",\"crypto\":{\"cipher\":\"aes-128-ctr\",\"ciphertext\":\"6eb1cb3ecb62de3d74743aa1a85b4440cb51e0288b1cb827f1894c83a2dcd3be\",\"cipherparams\":{\"iv\":\"33c18a431d7b47b2394b2e6a9d0f484e\"},\"kdf\":\"scrypt\",\"kdfparams\":{\"dklen\":32,\"n\":4096,\"p\":6,\"r\":8,\"salt\":\"e23d0b3d4d46eb626162d040662dfe9604d6ad550e1bf63262ae666aa94bb062\"},\"mac\":\"e4db9b68d391805abf2b0d67ccf03b47406c9c464259799748f27ced40a12ed1\"},\"id\":\"d31c84a1-c985-4dd7-bfca-94acd7bea7ce\",\"version\":3}")
    sleep(3)
    $driver.find_element(id:$element_table['confirmBtn']).click
    sleep(3)
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
    is_element_displayed("id", $element_table['SetNameText'])
end
  
When /點選設定錢包名稱^$/do
$driver.find_element("id",$element_table['SetNameConfirmBtn']).click
end

Then /^進入設定錢包頁面$/ do
element = $driver.find_element("id",$element_table['title'])
end
Then /^輸入新的錢包名稱$/ do 
$driver.find_element(id:$element_table['edt_wallet_name']).send_keys(element.Text)
end
Then /^點選Confirm後，回到前頁$/ do 
$driver.find_element("id",$element_table['WalletNameConfirm']).click
end



     
