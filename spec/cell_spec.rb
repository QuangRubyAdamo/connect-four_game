module ConnectFourGame
  RSpec.describe Cell do
    context "#initialize" do
      it "initializes the cell" do
        expect { Cell.new }.to_not raise_error
      end
    end
  end
end
