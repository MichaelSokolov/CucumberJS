Feature: Check Email field functionality

    # The background step is used for common steps (preconditions). 
    # It will be executed before each scenario.
    Background: 
        Given I navigate to "https://skryabin.com/market/quote.html" website

    @email
    Scenario Outline: Error message validation for invalid email
        When I enter "<email>" to the "email" field
        Then the error message "Please enter a valid email address." should be shown for "email" field

        Examples:
        | email             |
        | testmail@gmail.   |
        | testmailgmail.com |
        | testmail@.com     |
