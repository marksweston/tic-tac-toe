Feature: The player starts a game

  Scenario: Starting a game of
    Given I am not playing tic-tac-toe
    When I start a game
    Then I should see "Which player do you want to be? X or O?"

  Scenario: Choosing to be player X
    Given I have started a game
    When I choose player "X"
    Then I should see an empty board
    And I should see "Where do you want to move?"

  Scenario: Choosing to be player O
    Given I have started a game
    When I choose player "O"
    Then I should see a board where X has made the first move
    And I should see "Where do you want to move?"