root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/connect_four_game.rb"

puts "======================================== Welcome to Connect four game ==========================================="

puts "Please select option below:"
puts "1. CPU vs CPU"
puts "2. Human vs CPU"
puts "3. Human vs Human"

option = gets.chomp.to_i

case option
when 1
  player1 = ConnectFourGame::ComputerPlayer.new("Computer 1", "X")
  player2 = ConnectFourGame::ComputerPlayer.new("Computer 2", "O")
  ConnectFourGame::GameBoard.new([player1, player2]).play
when 2
  player1 = ConnectFourGame::HumanPlayer.new("Player 1", "X")
  player2 = ConnectFourGame::ComputerPlayer.new("Computer", "O")
  ConnectFourGame::GameBoard.new([player1, player2]).play
when 3
  player1 = ConnectFourGame::HumanPlayer.new("Player 1", "X")
  player2 = ConnectFourGame::HumanPlayer.new("Player 2", "O")
  ConnectFourGame::GameBoard.new([player1, player2]).play
else
  puts "Not a valid option!"
end
