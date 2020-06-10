 require 'pry'

# class TicTacToe


#     def initialize
#       @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#     end

#     WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
# ]

#     def display_board
#         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#         puts "-----------"
#         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#         puts "-----------"
#         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#     end

#     def input_to_index(user_input)
#         user_input.to_i - 1
#     end

#     def move(index, move)
#         @board[index] = move
#     end

#     def position_taken?(index)
#         if @board[index] == " "
#             return false
#         else
#            return true 
#         end
#     end

#     def valid_move?(index)
#         index < 9 && !position_taken?(index)
#         #index.between?(0..8) && !position_taken?(index)
#     end

#     def turn_count
#         @board.count("X") + @board.count("O")
#     end

#     def current_player
#         if self.turn_count.even? 
#            return "X" 
#         else
#             return "O"
#         end
#     end
   
#     #   def turn
#     #     user_input= gets.chomp
#     #     puts user_input
#     #     index = input_to_index(user_input)
#     #     if valid_move?(index)
#     #       player_token = current_player
#     #       move(index, player_token)
#     #       display_board
#     #     else
#     #       turn
#     #     end
#     #   end
#         # def turn
#         #     user_input = gets.chomp
#         #     puts user_input
#         #     index = input_to_index(user_input)
#         # if valid_move?(index)
#         #     player_token = current_player
#         #     move(index, player_token)
#         #     display_board
#         # else
#         #     turn
#         # end

#         def turn
#             puts "Please enter a number (1-9):"
#             user_input = gets.strip
#             index = input_to_index(user_input)
#         if valid_move?(index)
#               token = current_player
#               move(index, token)
#         else
#               turn
#         end
#         display_board
#      end

#       def won?
#       WIN_COMBINATIONS.each {|win_combo|
#         index_0 = win_combo[0]
#         index_1 = win_combo[1]
#         index_2 = win_combo[2]
#         position_1 = @board[index_0]
#         position_2 = @board[index_1]
#         position_3 = @board[index_2]
#         if position_1 == "X" && position_2 == "X" && position_3 == "X"
#           return win_combo
#         elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#           return win_combo
#         end
#       }
#       return false
#     end

#     def full?
#     @board.all? {|occupied| occupied != " "}
#   end

#   def draw?
#     !(won?) && (full?)
#   end

#   def over?
#     won? || full? || draw?
#   end

#   def winner
#     WIN_COMBINATIONS.detect do |win_combo|
#             if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
#                 return "X"
#             elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
#                 return "O"
#             else
#                 nil
#             end
#         end
#     end

#     def play
#         turn until over?
#         puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#       end
#     end


#end
#binding.pry
#test = [1, 2, 3]

# --------------
class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count("X") + @board.count("O")
    #@board.count{|square| square != " " }
  end

  def current_player
    if self.turn_count.even? 
      return "X" 
   else
       return "O"
   end
end
 
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all?{|square| square != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
#binding.pry

