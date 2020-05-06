require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
  
  def input_to_index(number)
    number.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |index| 
      if index != " "
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Pick a spot from 1-9"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    counter = 0
    while counter < WIN_COMBINATIONS.length
      combo = WIN_COMBINATIONS[counter]
      x = combo.all?{|pos| @board[pos] == "X"}
      o = combo.all?{|pos| @board[pos] == "O"}
      if x == true || o == true
        return combo
      else
        false
      end
      counter += 1
    end
  end
  
  def full?
    turn_count == 9 && !won?
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    until over? || won?
      turn
    end
    if over? && !draw?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end