Feature: landing page
  
  @firstcase
  Scenario: If user disagree terms, user can't create wallet.
    Given I agree terms
    When I retrieve wallet
    Then I should see Wallet Ready message

  
  Scenario: If user skip Setting Pin,user can see the inside page.
    When I skip the PIN Setting
    Then I should see Set Name Text

  
  @last
  Scenario: if user select to set the wallet name,user can see the setting page.
    Given I choose to setting the wallet name 
    Then the element having id "title" should have text as "Rename Wallet"
    Then the element having id "WalletNameEdit" should have text as "Unnamed Wallet"
    

