module ConnectFourGame
  class Helper
    def self.is_numberic?(string)
      return false if string.empty?

      string.scan(/\D/).empty?
    end
  end
end
