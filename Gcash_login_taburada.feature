Feature: Gcash Login


  Scenario Outline: Successful Login using MPIN
    Given user is on Login Page
    When  user enter the correct MPIN combination "<MPIN>"
    Then  user should be able to login "<Result>"

    Examples:
      | MPIN | Result  |
      | 1234 | success |



  Scenario Outline: Unsuccessful Login using MPIN
      Given user is on Login Page
      When  user enter the incorrect MPIN combination "<MPIN>"
      Then  user should not be able to login "<Result>"

    Examples:
      | MPIN | Result |
      | 1232 | fail   |



  Scenario Outline: Login using incorrect MPIN three consecutive times
      Given user is on Login Page
      When  user has entered an incorrect MPIN three consecutive times "<MPIN>"
      Then  user should not be able to proceed "<Result>"
      And   locked out of the Gcash account "<Status>"

    Examples:
      | MPIN | Result | Status |
      | 1232 | fail   | Two attempts remaining  |
      | 3456 | fail   | One attempt remaining   |
      | 4532 | fail   | User is locked out      |

  Scenario: The user has a lock out duration of 24 hours when failed to login three consecutive times
      Given user has locked out of the Gcash account
      When  user failed to login after three consecutive attempts
      Then  user has to wait for 24 hours before trying to relogin


    Example:
    | MPIN | Result | Status |
    | 1234 | fail   | User Locked Out for 24 hours|



  Scenario: A notification to renew the current MPIN appears after 90 days
      Given the current MPIN has expired after 90 days
      When  user tries to enter tne current MPIN
      Then  user is prompted with a notification to renew MPIN



