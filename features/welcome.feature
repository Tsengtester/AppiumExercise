Feature: landing page
  
  @firstcase
  Scenario: If user disagree terms, user can't create wallet.
    Given I agree terms
    When I retrieve wallet
    Then I should see Wallet Ready message

  @last
  Scenario: If user skip Setting Pin,user can see the inside page.
    When I skip the PIN Setting
    Then I should see Set Name Text
  
  Scenario:如果點選設定錢包名稱，可進入設定錢包名稱頁面
    When 點選設定錢包名稱
    Then 進入設定錢包頁面
    Then 輸入新的錢包名稱
    Then 點選Confirm後，回到前頁
    