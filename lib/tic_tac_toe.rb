class TicTacToe

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  def current_player
    #if the turn count is an even number, that means O just went, so the next/current player is X
    num_turns = turn_count
    if num_turns % 2 == 0
      player = "X"
    else
      player = "O"
    end
    return player
  end
  
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]
  
      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    }
    return false
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    until over? == true
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  end

# class TicTacToe
#     def initialize(board = nil)
#         @board = board || Array.new(9, " ")
#     end

#     WIN_COMBINATIONS = [
#         [0, 1, 2],
#         [3, 4, 5],
#         [6, 7, 8],
#         [0, 3, 6],
#         [1, 4, 7],
#         [2, 5, 8],
#         [0, 4, 8],
#         [6, 4, 2]
#     ]

#     def display_board
#         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#         puts "-----------"
#         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#         puts "-----------"
#         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#       end

#     def input_to_index(user_input)
#         user_input.to_i - 1 
#         #We would use the .to_i method to change
#         #strings (which are what user inputs are)
#         #into integers, then minus 1 because the array counts up to 8, not 9.
#     end

#     def move(index, current_player = "X")
#         @board[index] = current_player
#     end

#     def position_taken?(index)
#         if (@board[index] == " ") || (@board[index] == nil)
#             #When playing this game, a user can’t place their token on a square that’s
#             #already taken. In other words, we have to validate the code to ensure that
#             #the square being taken is really empty. Let’s define the method that
#             #determines how to validate a taken position.
#             return false
#         else
#             return true
#         end
#     end

#     def valid_move?(index)
#         if index.between?(0,8) && !position_taken?(index)
#             #Now we validate the user’s input (which is an integer representing the
#             #board’s array). If the user’s input converted index number is between 0–8
#             #(the array index) and its position is NOT taken then the move is valid (true)
#             return true
#         end
#     end
    
#     def turn
#         puts "Please choose a number 1-9:"
#         user_input = gets.chomp
#         index = input_to_index(user_input)
#         if valid_move?(index)
#             player_token = current_player
#             move(index, player_token)
#             display_board
#         else
#             turn
#         end
#     end

#     def turn_count
#         turn = 0 #counter
#         @board.each do |index|
#             if index == "X" || index == "O"
#                 counter += 1
#             end
#         end
#         turn
#     end

#     def current_player
#         num_of_turns = turn_count
#         if num_of_turns % 2 == 0
#             player = "X"
#         else
#             player = "O"
#         end
#         return player
#       end
#     end

#     def won?
#         WIN_COMBINATIONS.each do |win_combination|
#             index_0 = win_combination[0]
#             index_1 = win_combination[1]
#             index_2 = win_combination[2]

#             position_1 = @board[index_0]
#             position_2 = @board[index_1]
#             position_3 = @board[index_2]

#             if position_1 == "X" && position_2 == "X" && position_3 == "X"
#                 return win_combination
#             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#                 return win_combination
#             end
#         end
#         return false
#     end
    
#     def full?
#         @board.all? {|i| i == "X" || i == "O"}
#     end

#     def draw?
#         if !won? && full?
#             true
#         else
#             false
#         end
#     end

#     def over?
#         if won? || full?
#             true
#         else
#             false
#         end
#     end
    
#     def winner
#         index = []
#         index = won?
#         if index == false
#             nil
#         else
#             if @board[index[0]] == "X"
#                 return "X"
#             else
#                 return "O"
#             end
#         end
#     end

#     def play
#         until over? == true
#             turn
#         end

#         if won?
#             puts "Congratulations #{winner}!"
#             elsif draw?
#                 puts "Cats Game!"
#         end
#     end

# end
