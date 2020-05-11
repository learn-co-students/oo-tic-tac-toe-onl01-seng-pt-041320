require 'pry'

class TicTacToe
    attr_accessor :board
    
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #or @board = (9, " ")
    end

        WIN_COMBINATIONS = [
            [0, 1, 2], #top row
            [3, 4, 5], #middle row
            [6, 7, 8], #bottom
            [0, 4, 8], #diagonal from the left
            [2, 4, 6], #diagonal from right
            [0, 3, 6], #left row down
            [2, 5, 8], #right row down
            [1, 4, 7], #middle row down
        ]
    
    def display_board #drawing board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5] } "
        puts "-------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        # puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        # puts "-----------"
        # puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        # puts "-----------"
        # puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def input_to_index(input)
        index = input.to_i - 1
        # binding.pry
    end

    def move(index, token = "X")
        @board[index] = token
        # binding.pry
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else
           return true
        end
        # binding.pry
    end 

    def valid_move?(index)
       index.between?(0,8) && @board[index] == " " ? true : false | nil
        # binding.pry
    end

    def turn_count
        @board.count {|i| i != " " }
    end

    def turn
      puts "Choose between 1-9"  
      user_input = gets.chomp
      index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
    #    binding.pry
        end
    end

    def current_player
        player = turn_count
        player %2 == 0 ? player = "X" : player = "O"
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
                index_0 = combo[0]
                index_1 = combo[1]
                index_2 = combo[2]
        
                position_1 = @board[index_0]
                position_2 = @board[index_1]
                position_3 = @board[index_2]
        
                if position_1 == "X" && position_2 == "X" && position_3 == "X"
                    return combo
                elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                    return combo
                end
            end
            return false
    end
   
    def full?
        !@board.include? " "
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        draw? || won?        
        # binding.pry
    end
    
    def winner
        WIN_COMBINATIONS.each do |combo|
            index_0 = combo[0]
            index_1 = combo[1]
            index_2 = combo[2]

            position_1 = @board[index_0]
            position_2 = @board[index_1]
            position_3 = @board[index_2]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return "X"
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return "O"
            end
        end
        return nil
        # binding.pry 
    end

    def play
        until over? == true || won? != false
          turn
        end
        if winner
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        else
          return nil
        end
        
    end      
end