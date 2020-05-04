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
        #binding.pry
    end

    def valid_move?(index)
        if @board[index] == "X" || @board[index] == "O" && index > 0 && index <= 9
            false
        elsif index > 9
            false
        else
            true
        end
    end

    def turn(input)
        x = gets
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
end