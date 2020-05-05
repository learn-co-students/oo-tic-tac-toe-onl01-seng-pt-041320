require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2], #Top Row
        [3,4,5],  #Middle Row
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
       num = input.to_i
       return num - 1 
    end

    def move(index, token="X")
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
        #!true = false
        #!false = true
        if !position_taken?(index) && index.between?(0,8)
            return true
        else
            return false
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        #strip removes new lines and characters at the end of a string
        idx = input_to_index(input)
        if valid_move?(idx)
            move(idx, current_player)
            display_board
        else
            turn
        end
    end

    def turn_count
        x = @board.count("X")
        y = @board.count("O")
        return x + y
    end

    def current_player
        if turn_count % 2 == 0
            return "X" 
        else
            return "O"
        end
    end

    def won?
        combo = 0
        while combo < WIN_COMBINATIONS.length
            new_combo = WIN_COMBINATIONS[combo]
            x = new_combo.all?{|pos| @board[pos] == "X"}
            o = new_combo.all?{|pos| @board[pos] == "O"}
            if x == true || o == true
                return new_combo
            else
                false
            end
            combo += 1
        end
    end

    def full?
        @board.each do |element|
            if element == " "
                return false
            end
        end
        return true
    end

    def draw?
        if !won? && full?
            return true
        end
        return false
    end

    def over?
        if won? || full?
            return true
        end
        return false
    end

    def winner
        #binding.pry
        if won?
           @board[won?[1]] 
        end
        #x = won?.each{|position| @board[position] == "X"}
        #o = won?.each{|position| @board[position] == "O"}
        #position_taken?(won?)
    end

end