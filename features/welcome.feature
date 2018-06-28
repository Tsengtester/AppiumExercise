Feature: landing page
  
  Scenario: If user disagree terms, user can't create wallet.
    Given I agree terms
    When I retrieve wallet
    Then I should see Wallet Ready message
    