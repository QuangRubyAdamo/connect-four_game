require_relative "connect_four_game/version"

module ConnectFourGame; end

# require_relative "./connect_four_game/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/connect_four_game/**/*.rb"].each { |file| require file }
