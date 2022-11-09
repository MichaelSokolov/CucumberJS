Feature: Check password functionality

    # The background step is used for common steps (preconditions). 
    # It will be executed before each scenario.
    Background: 
        Given I navigate to "https://skryabin.com/market/quote.html" website

    @password
    Scenario Outline: Error message validation for a short password
        When I enter "<password>" to the "password" field
        Then the error message "Please enter at least 5 characters." should be shown for "password" field

        Examples:
            | password |  
            | x        |
            | xy       |
            | xyz      |
            | xyzq     |
    
    @password
    Scenario: Error message validation for different passwords
        When I enter "12345" to the "password" field
        And I enter "54321" to the "confirmPassword" field
        Then the error message "Passwords do not match!" should be shown for "confirmPassword" field
