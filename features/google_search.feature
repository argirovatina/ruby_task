Feature: As user I can search words on google.com and make screenshots of the pages

  Background: I google word 'aikido'
    Given As user I navigate to "http://google.com"
    And I google word "aikido"

  Scenario: I check this word on Wikipedia site
    And I select "Wikipedia" site
    Then I assure I am on correct site
    And I check description of aim word on the page
    Then I make screenshot of the page

  Scenario: I check this word on next to Wikipedia site
    And I search for not "Wikipedia" or "Википедия" site
    And I check description of another aim word on the page
    Then I make screenshot of the page