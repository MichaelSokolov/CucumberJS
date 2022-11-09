Feature: Check Username field functionality

    # The background step is used for common steps (preconditions). 
    # It will be executed before each scenario.
    Background: 
        Given I navigate to "https://skryabin.com/market/quote.html" website

    @username
    Scenario: Error message validation for short username
        When I enter "t" to the "username" field
        Then the error message "Please enter at least 2 characters" should be shown for "username" field
