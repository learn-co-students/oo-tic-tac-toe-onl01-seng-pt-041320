class TicTacToe
  attr_reader :board, :clear_spot
 
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]
 
  def initialize
      @board = [] 
      9.times {@board << " "}
      @clear_spot = " "
  end 
  
  def display_board
   puts  " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts  "-----------"
   puts  " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts  "-----------"
   puts  " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
      input.to_i - 1
  end 
  
  def move(index, token = "X")
      @board[index] = token
  end
  
  def position_taken?(index)
      @board[index] == @clear_spot? false : true 
  end 
  
  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end
  
      
  def turn
      puts "Please enter 1-9:"
      input = gets.chomp.to_i 
      index = input_to_index(input)
      if valid_move?(index) == true 
          move(index, current_player)
          display_board
      else 
          puts "Please enter 1-9:"
          input = gets.chomp.to_i 
      end 
      
  end 
  
  def turn_count
      @board.select{|turn| turn=="X" || turn=="O"}.length
  end 
  
  def current_player
      if turn_count%2 == 0
        "X"
      else
        "O"
      end 
  end 
  
  def won?
      result = false 
      WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|index| @board[index]=="X"} || win_combination.all?{|index| @board[index]=="O"}
          result = win_combination
      end 
    end 
    result
  end 
  
  def full?
      @board.all?{|index| (index=="X"||index=="O")}
  end 
  
  def draw?
      !won? && full?
  end 
  
  def over?
      won? || full? || draw?
  end
  
  def winner
       winning = won?
    if winning
      @board[winning[0]]
    end 
  end 
  
  def play 
     until over?
         turn
      end 
     if draw?
           puts  "Cat's Game!"
       else 
          puts  "Congratulations #{winner}!"
    end 
  end 
end 