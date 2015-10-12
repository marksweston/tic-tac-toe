Feature: The player makes moves alternating with the computer

  Scenario: Making a first move
    Given I have started a game as player "X"
    When I move to "A1"
    Then I should see an "X" in "A1"
    And I should see that the computer has placed an "O" in response
    And I should see "Where do you want to move?"