require 'stringio'

module ConnectFourGame
  RSpec.describe Player do
    context "#initialize" do
      it "initializes player" do
        expect { Player.new('name', 'token') }.to_not raise_error
        expect { HumanPlayer.new('name', 'token') }.to_not raise_error
        expect { ComputerPlayer.new('name', 'token') }.to_not raise_error
      end
    end

    context ".make_a_move" do
      subject { HumanPlayer.new('player 1', 'X') }
      let(:board) { ConnectFourGame::Board.new }

      context "when move with valid cell" do
        before do
          allow_any_instance_of(Object).to receive(:gets).and_return("0\n")
        end

        after do
          $stdin = STDIN
        end

        it 'make a valid move' do
          expect { subject.make_a_move(board) }.not_to raise_error
          expect(board.grid[5][0].value).to eq 'X'
        end
      end
    end
  end
end
