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