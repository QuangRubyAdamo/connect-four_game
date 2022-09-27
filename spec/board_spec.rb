module ConnectFourGame
  RSpec.describe Board do
    context "#initialize" do
      it "initializes the board" do
        expect { Board.new }.to_not raise_error
      end

      it "sets the grid with 6 rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(6)
      end
    end

    context ".fill_column" do
      subject { Board.new }

      context "when fill with invalid column" do
        it "raise error" do
          expect { subject.fill_column(111, 'X') }.to raise_error
        end
      end

      context "when fill with valid column" do
        it "not raise error" do
          expect { subject.fill_column(0, 'X') }.not_to raise_error
          expect(subject.grid[5][0].value).to eq 'X'
        end
      end

      context "when fill with full column" do
        before do
          (1..6).each { |_| subject.fill_column(0, 'X') }
        end

        it "raise error" do
          expect { subject.fill_column(0, 'X') }.to raise_error
        end
      end
    end

    context ".won_game?" do
      subject { Board.new }

      context 'when init board' do
        it "returns true" do
          expect(subject.won_game?).to eq false
        end
      end

      context "when win game by 4 in a row" do
        before do
          (1..4).each { |col| subject.fill_column(col, 'X') }
        end

        it "returns true" do
          expect(subject.won_game?).to eq true
        end
      end

      context "when win game by 4 in a column" do
        before do
          (1..4).each { |_| subject.fill_column(0, 'X') }
        end

        it "returns true" do
          expect(subject.won_game?).to eq true
        end
      end

      context "when win game by 4 in upward diaganol" do
        before do
          start_row = 3
          subject.grid[start_row][0].value = 'X'
          (1..3).each { |index| subject.grid[start_row - index][index].value = 'X' }
        end

        it "returns true" do
          expect(subject.won_game?).to eq true
        end
      end

      context "when win game by 4 in downward diaganol" do
        before do
          start_row = 0
          subject.grid[start_row][0].value = 'X'
          (1..3).each { |index| subject.grid[start_row + index][index].value = 'X' }
        end

        it "returns true" do
          expect(subject.won_game?).to eq true
        end
      end
    end
  end
end
