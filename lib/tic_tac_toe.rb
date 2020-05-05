class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

def move(index, value)
  @board[index] = value.upcase
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end


def valid_move?(index)
   index.between?(0, 8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
end
end

def turn_count
  counter = 0
@board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
counter
end

def current_player
  turn_count.even? ? "X" : "O"
end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      win_combination.all? {|win_index| @board[win_index] == "X"} ||
      win_combination.all? {|win_index| @board[win_index] == "O"}
    end
  end

  def full?
    @board.none? {|move| move == " "}
  end

  def draw?
   full? && !won?
 end


  def over?
    won? || draw?
  end

 def winner
   if won?
  @board[won?.first]
end
 end

 def play
   turn until over?
   if won?
     puts "Congratulations #{winner}!"
   else draw?
     puts "Cat's Game!"
   end
 end

end
