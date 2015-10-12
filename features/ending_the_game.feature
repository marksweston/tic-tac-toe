Feature: The game ends when one player wins, or there's a draw when the board is full

  Scenario: Ending in a draw
    Given I have started a game as player "X"
    And I and the computer have made four moves each
    When I move to the last square
    Then I should see "Draw!"