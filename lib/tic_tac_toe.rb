class TicTacToe
    def initialize(board = [" "," "," "," "," "," "," "," "," "])
        @board = board  #initialized with 9 blank spaces.
    end

    #Win Combinations Constant
    WIN_COMBINATIONS = [ 
        [0, 1, 2], # Top Row Win 1
        [3, 4, 5], # Middle Row Win 2
        [6, 7, 8], # Bottom Row Win 3
        [0, 3, 6], # Left Column Win 4
        [1, 4, 7], # Middle Column Win 5
        [2, 5, 8], # Right Column Win 6
        [0, 4, 8], # Left Diagonal Win 7
        [2, 4, 6]  # Right Diagonal Win 8
    ]

    def display_board           # CLI Board Design
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts "-----------"
    end

    def input_to_index(user_input)
        @user_input = user_input
        user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " " && @board[index] != ""
    end

    def valid_move?(index)
        index.between?(0,8) && ! position_taken?(index)
    end

    def turn 
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input) 
        if valid_move?(index) 
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def turn_count 
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] && 
            position_taken?(combo[0])
        end
    end

    def draw?
        full(@board) && !won?(@board)
    end

    def full?
        @board.all? {|position| position == "X" || position == "O"}
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if winning_combo = won? 
            @board[winning_combo.first]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
    
end

