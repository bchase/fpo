Feature:
  Card creation and management

  # # already covered in deck feature
  # Scenario: Card builder after creating a Deck
  #   Given I'm logged in
  #   And I've just created a Deck
  #   And I've been redirected to the Card builder 
  #   Then I should see the first line of the song

  Scenario: Create a new Card w/ multiple gloss Expressions after creating a Deck
    Given I'm logged in
    And I've just created a Deck
    And I've been redirected to the Card builder
    When I press "Yes"
    # And I click "沒說的"
    And I press "沒"
    And I press "Use All"
    And I press "Target"
    And I press "Create Card"
    Then I should see "攢着是因為想寫成歌"
    And there should be one Card in the Deck
    And that card should have a target Word with multiple glosses

  # Scenario: Create a new Card w/ a single gloss Expression after creating a Deck
  #   Given I'm logged in
  #   And I've just created a Deck
  #   And I've been redirected to the Card builder
  #   When I press "Yes"
  #   And I click "沒說的"
  #   # And I click "沒" # ???
  #   And I press "沒說的"
  #   And I press "Gloss"
  #   And I press "Create Card"
  #   And I fill in "Notes" with "mei2shuo1de"
  #   Then I should see "攢着是因為想寫成歌"
  #   And there should be one Card in the Deck
  #   And that Card should have a gloss Word with a single gloss
  #   And that Card's notes should be "mei2shuo1de"

  # Scenario: Create a new Card w/ target Word after creating a Deck
  #   Given I'm logged in
  #   And I've just created a Deck
  #   And I've been redirected to the Card builder
  #   When I press "Yes"
  #   And I click "沒說的"
  #   # And I click "沒" # ???
  #   And I press "All"
  #   And I press "Target"
  #   And I press "Create Card"
  #   Then I should see "攢着是因為想寫成歌"
  #   And there should be one Card in the Deck
  #   And that card should have a target Word with multiple glosses

  # Scenario: Add a new Card to an existing Deck
  # idea: timestamp cards (deck w/ link)
