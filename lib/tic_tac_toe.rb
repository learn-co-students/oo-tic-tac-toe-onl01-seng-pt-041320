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
    if @board[index] == "X" || @board[index] == "O" 
      true 
    else
      false
    end
  end
  
  def valid_move?(index)
    if @board[index] == " "
      true
    else
      nil
    end
  end
  
  def turn_count
    @board.count{ |x| x if x == "X" || x == "O"}
  end
  
  def current_player
    if turn_count.even? == true 
      "X"
    else
      "O"
   end
  end
  
  def turn
    puts "put input"
    input = input_to_index(gets)
    if valid_move?(input)
       move(input, current_player)
       display_board
    else
      puts "put input"
      input_again = gets
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |x|
       
        
     
    end
  end
 
  def full?
  end
  
end