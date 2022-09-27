module ConnectFourGame
  RSpec.describe Helper do
    context ".is_numberic?" do
      context 'when check with valid string' do
        ["12", "03", "0060"].each do |valid_string|
          it "returns true" do
            expect(Helper.is_numberic?(valid_string)).to eq true
          end
        end
      end

      context 'when check with invalid string' do
        ["", "034ff", "-0060", "-3", "fasdf", "$%#32", "423@"].each do |invalid_string|
          it "returns false" do
            expect(Helper.is_numberic?(invalid_string)).to eq false
          end
        end
      end
    end
  end
end
