Feature:
  Deck creation and management

  Scenario: Create a new Deck using lyrics
    Given I'm logged in
    And I visit the new Deck page
    # And I select "Song" from "Type"
    When I fill in "Name" with the song name
    When I fill in "Artist" with the artist's name
    When I fill in "Text" with the lyrics
    # When I fill in "Link" ...
    And I press "Create Deck"
    Then I should see the first line of the song
    And I should have a new Deck
  
  # Scenario: Export Deck (Anki)
  #   Given I'm logged in
  #   And I have a populated Deck
  #   When I navigate to that Deck
  #   And click "Export as Anki Deck (tab-separated)"
  #   Then I should see that Deck as an Anki export

  # Scenario: Export Deck (Mnemosyne)

  # Scenario: View Cards for Deck
