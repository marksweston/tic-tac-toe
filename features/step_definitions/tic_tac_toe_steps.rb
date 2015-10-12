require_relative '../../lib/tic_tac_toe'
require 'pry'

class Output
  attr_reader :messages

  def initialize
    @messages = []
  end

  def puts(message)
    @messages << message
  end
end

def game_output
  return @output ||= Output.new
end

def gameboard_pattern
  return /A\sB\sC\n\s\s\+-\+-\+-\+\n1\s\|[XO\s]\|[XO\s]\|[XO\s]\|\n2\s\|[XO\s]\|[XO\s]\|[XO\s]\|\n3\s\|[XO\s]\|[XO\s]\|[XO\s]\|\n\s\s\+-\+-\+-\+/
end

Given(/^I am not playing tic\-tac\-toe$/) do
  #noop
end

When(/^I start a game$/) do
  TicTacToe::Game.new(game_output).start
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(game_output.messages).to include message
end

Given(/^I have started a game$/) do
  @game = TicTacToe::Game.new(game_output)
  @game.start
end

When(/^I choose player "([^"]*)"$/) do |player|
  @game.choose_player player
end

Then(/^I should see an empty board$/) do
  expect(game_output.messages[-3]).to match gameboard_pattern
end

Then(/^I should see a board where X has made the first move$/) do
  expect(game_output.messages[-3]).to match gameboard_pattern
  expect(game_output.messages[-3].count("X")).to eql 1
end

Given(/^I have started a game as player "([^"]*)"$/) do |player|
  @game = TicTacToe::Game.new(game_output)
  @game.start
  @game.choose_player player
end

When(/^I move to "([^"]*)"$/) do |square|
  @game.make_player_move square
end

Then(/^I should see an "([^"]*)" in "([^"]*)"$/) do |marker, square|
  expect(game_output.messages[-3]).to match /1\s\|[X]\|[O\s]\|[O\s]\|\n/
end

Then(/^I should see that the computer has placed an "([^"]*)" in response$/) do |marker|
  expect(game_output.messages[-3].count(marker)).to eql 1
end

Given(/^I and the computer have made four moves each$/) do
  board = TicTacToe::Board.new
  board["A1"] = "X"
  board["B1"] = "O"
  board["C1"] = "X"
  board["A2"] = "O"
  board["B2"] = "X"
  board["C2"] = "O"
  board["B3"] = "X"
  board["C3"] = "O"
  @game = TicTacToe::Game.new(game_output, board, false)
  @game.start
  @game.choose_player "X"
end

When(/^I move to the last square$/) do
  @game.make_player_move "A3"
end
