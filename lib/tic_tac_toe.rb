require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]
    
  def initialize
    @board = Array.new(9," ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i-1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
     @board[index] == "X" || @board[index] == "O" 
     
  end
  
  def valid_move?(index)
    (0...8).include?(index) && 
      !position_taken?(index) 
       
  end
  
  def turn_count
    @board.count{ |x| x == "X" || x == "O"}
  end
  
  def current_player
    if turn_count.even? 
      "X"
    else
      "O"
   end
  end
  
  def turn
    puts "put input"
    input = gets.chomp
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
  end
  
  def won?
   WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[1])
#    binding.pry
  end
  end
 
  def full?
    @board.all?{|x| x == "X" || x == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if combo = won?  #you can store a method outcome in a variable
      @board[combo[0]]
    end
  end
  
  def play 
    until over?
      turn 
    end
    
    if draw?
      puts "Cat's Game!"
    else 
      puts "Congratulations #{winner}!"
    end
  end 
  
  
end