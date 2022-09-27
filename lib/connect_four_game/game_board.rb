module ConnectFourGame
  class GameBoard
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def play
      puts "#{current_player.name} as the first player (your token is #{current_player.token})"

      turns = 0
      max_moves = Constant::BOARD_COLUMN * Constant::BOARD_ROW

      until board.won_game? || turns == max_moves
        turns += 1

        board.print_board

        puts "-------------------------------------------------------------------"
        puts "#{current_player.name}'s turn (token is #{current_player.token}). Please enter from 0 to 6"
        puts "-------------------------------------------------------------------"

        current_player.make_a_move(board)
        switch_players
      end
      switch_players

      board.print_board

      if turns < max_moves
        puts "#{current_player.name} (token is #{current_player.token}) won the game!"
      else
        puts "Draw!"
      end
    end
  end
end
