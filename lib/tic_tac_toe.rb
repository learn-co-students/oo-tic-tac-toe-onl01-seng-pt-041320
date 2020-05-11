require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
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
  
  def input_to_index(input)
    index = input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] == " "? false : true 
  end
  
  def valid_move?(position)
    position.between?(0,8) && @board[position] == " "? true : false
  end
  
  def turn_count
    @board.count{|x| x != " "}
  end
  
  def current_player
    player = turn_count
    player % 2 == 0? player = "X" : player = "O"
  end
  
  def turn 
    puts "Play a number 1 - 9"
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
    WIN_COMBINATIONS.detect(->{false}) do |win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]
      
      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]
      
        if 
          @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
          win_combo
       elsif
          @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          win_combo
        else
          false
        end
      end
    end
    
    def full?
      @board.all?{|index| index != " "}
    end
    
    def draw?
      !won? && full?
    end
    
    def over?
      draw? || won?
    end
    
    def winner
      win_combo = won?
      if win_combo
        @board[win_combo[0]]
      end
    end
    
    def play 
      while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end
    end 


end


