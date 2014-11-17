# Tic-Tac-Toe game

class TicTacToe

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @players = {}
    @turn = 0
    @taken = {}
  end

  # Starts game
  def start
  	# Asks for player's names, create key-value pairs: player1_name => "X", player2_name => "O".
    puts "What is the first player's name?"
    input = gets.chomp
    @players[input] = "X"
    puts "What is the second player's name?"
    input = gets.chomp
    @players[input] = "O"

    # Allows game to loop until game is over (when game_in_progress is false)
    game_in_progress = true
    until game_in_progress == false
      display_board
      choose_move
      if game_over? == true
        puts "#{current_player} wins the game!"
        game_in_progress = false
      elsif tie? == true
        game_in_progress = false
      end
      # Increments @turn by 1 after each move
      @turn += 1
    end
    puts "Thanks for playing!"
    puts
  end

  # Displays the Tic Tac Board
  def display_board
    puts
    puts "Here is the current board:"
    puts 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts 
  end

  # Gets the player to select a valid move
  def choose_move
    puts "#{current_player}, select a cell to place your #{whose_turn}. Select a number between 1 - 9."
    move = gets.chomp.to_i
    puts

    # If move is valid and is not taken, then create a key-value pair in @taken: number => X or O.
    if valid_move?(move) && !taken?(move)
      @taken[move] = whose_turn
      update_board(move)
    # When it is not a valid move and the cell is not taken
    elsif !valid_move?(move) && !taken?(move)
      puts "That is not a valid choice. Please select a number between 1 and 9."
   	# When it is a valid move and the cell is taken 
    elsif valid_move?(move) && taken?(move)
      puts "That one has already been taken. Please select another cell."
    end
  end

  # If the current turn is even or the first turn, then player 1 goes. Else player 1 goes.
  def whose_turn
    if @turn % 2 == 0
      return "X"
    end
    return "O"
  end

  # Gets the name of the current player based on the number of turns
  def current_player
    @players.each do |name, letter|
      if letter == whose_turn
        return name
      end
    end
  end

  # Checks that the input is a number between 1 and 9
  def valid_move?(move)
    valid_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    if valid_numbers.include?(move)
      return true
    end
    return false
  end

  # Checks to see if the move has been made yet.  
  def taken?(move)
  	# Subtract 1 from move to correctly correspond with index
    if @board[move - 1] == "X" || @board[move - 1] == "O"
      return true
    end
    return false
  end

  # Updates the board after player selects a valid and free cell 
  def update_board(move)
    for i in 0...@board.length
      if move == @board[i]
        # replaces number with either X or O
        @board[i] = @taken[move]
      end
    end
  end

  # Checks to see if there is a winner.
  # Returns true if there is a winner, returns false if there is no winner.
  def game_over?
    x_array = []
    o_array = []
    @taken.each do |key, value|
      if value == "X"
        x_array << key
      else
        o_array << key
      end
    end
    # The x and o arrays are compared to 3 because 3 moves is the minimum number of moves needed to win
    if x_array.length >= 3 || o_array.length >= 3
      if three_in_a_row?(x_array) == true || three_in_a_row?(o_array) == true
        return true
      end
    else
      return false
    end
  end

  # Checks to see if an array from game_over? is a winning array.
  def three_in_a_row?(xo_array)
    winning_moves = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_moves.each do |array|
      if xo_array.sort == array
        return true
      end
    end
    return false
  end

  # Checks for a tie
  def tie?
    if @taken.length >= @board.length
      puts "It's a tie! Game over."
      return true
    end
    return false
  end
    
end
# created a new instance of class TicTacToe
new_game = TicTacToe.new
new_game.start