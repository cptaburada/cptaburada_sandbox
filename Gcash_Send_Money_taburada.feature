Feature: Send Money

  Background:
    Given the user is using the sent money feature

  Scenario Outline: Successful Send Money
    When  user has entered an amount and a mobile number
    Then  user should be able to sent money successfully

  Examples:
  | Amount | Mobile Number |
  | 100 PHP| 0915 123 4567 |

  Scenario Outline: Unsuccessful Sent Money (No Amount Entered)
    When  user has entered a mobile number but no amount
    Then  the sent money should not proceed

  Examples:
  | Amount | Mobile Number |
  | 0   PHP| 0915 123 4567 |

  Scenario: Unsuccessful Sent Money (Amount is more than the actual amount in Gcash App)
    When  user has entered a mobile number the amount is more than the actual amount in the Gcash App
    Then  an error should occur
    And   the sent money should not proceed


  Scenario Outline: Unsuccessful Sent Money (The entered mobile number is less than 11 digits)
    When  user has entered a mobile number but is less than 11 digits
    Then  an error should occur
    And   the sent money should not proceed

  Examples:
  |Amount | Mobile Number|
  |100 PHP| 0915 243 297 |


  Scenario Outline: Unsuccessful Sent Money (The entered mobile number is random characters and letters)
    When  user has entered a mobile number but is less than 11 digits
    Then  an error should occur
    And   the sent money should not proceed

  Examples:
  |Amount | Mobile Number|
  |100 PHP| 4rf^&HH*     |