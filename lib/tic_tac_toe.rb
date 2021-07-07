class TicTacToe
  attr_accessor :board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
    
  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    x = @board.count("X")
    y = @board.count("O")
    x + y
  end
  
  def current_player
    if turn_count.odd?
      return "O"
    else
      return "X"
    end
  end
  
  def turn
    puts "Please input a value from 1 to 9"
    input = gets.strip
    value = input_to_index(input)
    if valid_move?(value)
      move(value, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
     winning_combo = []
      WIN_COMBINATIONS.each do |array|
            x = array.all?{|index| @board[index] == "X"}
            o = array.all?{|index| @board[index] == "O"}
            if x == true || o == true
              winning_combo = array
            end
      end
    if winning_combo.empty?
      return false
    else
      return winning_combo
    end
  end
  
  def full?
    if @board.include?(" ")
      return false
    else 
      return true
    end
  end
  
  def draw?
    if full? == true && won? == false
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
    if won?
      WIN_COMBINATIONS.each do |array|
            x = array.all?{|index| @board[index] == "X"}
            o = array.all?{|index| @board[index] == "O"}
            if x == true 
              return "X"
            elsif o == true
              return "O"
            end
       end
     else
       return nil
     end
    end

  def play
    until over?
     turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
         
  end
    
    
end
