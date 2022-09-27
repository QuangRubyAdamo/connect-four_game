module ConnectFourGame
  class Player
    attr_accessor :name, :token

    def initialize(name, token)
      @name, @token = name, token
    end

    def make_a_move(board)
      begin
        board.fill_column(move(Constant::BOARD_COLUMN), @token)
      rescue Exception => error
        puts error
        retry
      end
    end
  end

  class ComputerPlayer < Player
    private

    def move(column)
      rand(column)
    end
  end

  class HumanPlayer < Player
    private

    def move(column)
      value = -1
      value = gets.chomp

      raise "Not valid number, please enter number between 0 and #{column - 1}" unless ConnectFourGame::Helper.is_numberic?(value)

      value.to_i
    end
  end
end
