module TicTacToe
  class Game
    def initialize(output = STDOUT, board = Board.new, exit_on_game_end = true)
      @output = output
      @board = board
      @exit_on_game_end = exit_on_game_end
    end

    def start
      @output.puts "Which player do you want to be? X or O?"
    end

    def choose_player(player)
      @player = player
      if @player == "X"
        @computer = "O"
      else
        @computer = "X"
        make_computer_move
      end
      show_board "Where do you want to move?"
    end

    def show_board(message)
      @output.puts @board.display
      @output.puts "\n"
      @output.puts message
    end

    def make_computer_move
      square = @board.empty_squares.sample
      @board[square] = @computer
    end

    def make_player_move(square)
      @board[square] = @player
      if won_or_drawn?
        end_game
      else
        make_computer_move
        show_board "Where do you want to move?"
      end
    end

    def won_or_drawn?
      return won? || drawn?
    end

    def won?

    end

    def drawn?
      if @board.empty_squares.count.zero?
        @endgame_message = "Draw!"
        return true
      end
    end

    def end_game
      show_board @endgame_message
      exit if @exit_on_game_end
    end
  end

  class Board
    def initialize
      @squares = [["\s", "\s", "\s"], ["\s", "\s", "\s"], ["\s", "\s", "\s"]]
    end

    def display
      board = "   A B C" + "\n" +
              "  +-+-+-+" + "\n" +
              "1 |#{@squares[0][0]}|#{@squares[1][0]}|#{@squares[2][0]}|" + "\n" +
              "2 |#{@squares[0][1]}|#{@squares[1][1]}|#{@squares[2][1]}|" + "\n" +
              "3 |#{@squares[0][2]}|#{@squares[1][2]}|#{@squares[2][2]}|" + "\n" +
              "  +-+-+-+"
      return board
    end

    def empty_squares
      result = []
      @squares.each_with_index do |column, column_no|
        column.each_with_index do |square, row_no|
          result << column_index.rassoc(column_no).first + (row_no + 1).to_s if square == "\s"
        end
      end
      return result
    end

    def []=(square, marker)
      column = column_index[square[0]]
      row = square[1].to_i - 1
      @squares[column][row] = marker
      return @squares
    end

    private

    def column_index
      return {"A" => 0, "B" => 1, "C" => 2}
    end
  end
end