Feature: landing page
  
  @firstcase 
  Scenario: If user disagree terms, user can't create wallet.
    When I retrieve wallet
    Then the element having id "MessageBar" should have text as "You need to read & accept the terms of service"
   
  @iosfirstcase @ios
  Scenario: If user agree terms, user can create wallet.
    Given I agree terms
    When I retrieve wallet
    And Retrieve By keyStore
    And Check keyStore Password
    Then I should see Wallet Ready message

  @ios
  Scenario: If user skip Setting Pin,user can see the inside page.
    When I skip the PIN Setting
    Then I should see Set Name Text

  @ios
  Scenario: if user select to set the wallet name,user can see rename.
    Given I choose to setting the wallet name 
    And the element having id "Functiontitle" should have text as "Rename Wallet"
    When user change the wallet name and submit
    Then the element having id "IndexTitle" should have text as "Assets"
    And the element having id "WalletName" should have text as "QAWallet"

  @ios
  Scenario: User Add Token Currency
    Given I choose to add Token Currency
    And the element having id "AddcurrencyTitle" should have text as "Add Token Currency"
    When User Add TWX Currency
    Then the element having xpath "TWX" should have text as "TWX"
  

  Scenario: User Send TWX
    Given I choose to send TWX
    And the element having id "AddcurrencyTitle" should have text as "Send Coin"
    When User Send TWX
    And Check keyStore Password
    Then the element having xpath "TWXChangeList" should have text as "-3.00 TWX"


  @last @ios
  Scenario: Ｕser Can retrieve the other wallet 
    Given I choose to retrieve more wallet  
    When Retrieve By Mnemonic
    Then I should see Wallet Ready message



  

    

