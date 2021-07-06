class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], # top row
        [3,4,5], # middle row
        [6,7,8], # bottom row
        [0,3,6], # left col
        [1,4,7], # mid col
        [2,5,8], # right col
        [0,4,8], # diag right down
        [2,4,6]  # diag left down
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
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count{ |token| token == "X" || token == "O" }
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9 to choose a square"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect(-> { false }) do |win_combo|
            if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
                win_combo
            elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
                win_combo
            end
        end
    end
    
    def draw?
        !won? && full?      
    end

    def full?
        @board.all?{ |index| index != " " }
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
        elsif draw?
            puts "Cat's Game!"
        end
    end

  end