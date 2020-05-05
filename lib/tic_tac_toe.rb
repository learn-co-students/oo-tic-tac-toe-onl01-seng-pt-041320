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
  
#def won?
#        combo = 0
#        while combo < WIN_COMBINATIONS.length
#            new_combo = WIN_COMBINATIONS[combo]
 #           x = new_combo.all?{|pos| @board[pos] == "X"}
 #           o = new_combo.all?{|pos| @board[pos] == "O"}
 #           if x == true || o == true
 #               return new_combo
 #           else
 #               false
 #           end
 #           combo += 1
 #   end


end
