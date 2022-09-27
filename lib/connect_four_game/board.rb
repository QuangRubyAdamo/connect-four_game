module ConnectFourGame
  class Board
    attr_accessor :grid

    def initialize
      @grid = Array.new(Constant::BOARD_ROW) { Array.new(Constant::BOARD_COLUMN) { Cell.new } }
    end

    def print_board
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "( )" : "(#{cell.value})" }.join(" ")
      end

      index_display = ""
      index_display += (0...Constant::BOARD_COLUMN).map { |index| " #{index}  "}.join
      puts index_display
    end

    def fill_column(column, token)
      raise "Invalid move, pick a column between 0 and #{Constant::BOARD_COLUMN - 1}" if (column < 0 || column > Constant::BOARD_ROW)

      free_slots = 0
      (0...Constant::BOARD_ROW).each do |row|
        free_slots += 1 if @grid[row][column].value.empty?
      end

      raise "Invalid move, column #{column} is full" if free_slots == 0

      @grid[free_slots - 1][column].value = token
    end

    def won_game?
      check_rows || check_columns || check_upward_diaganols || check_downward_diaganols
    end

    private

    def check_rows(grid = @grid)
      grid.each do |row|
        (0..3).each do |idx|
          won = row[idx..(idx + 3)].all? { |cell| cell.value == row[idx].value && !cell.value.empty? }
          return true if won
        end
      end

      false
    end

    def check_columns
      transposed_board = @grid.transpose
      transposed_board.each do |row|
        (0..2).each do |idx|
          won = row[idx..(idx + 3)].all? { |cell| cell.value == row[idx].value && !cell.value.empty? }
          return true if won
        end
      end

      false
    end

    def check_upward_diaganols
      won = false
      (3..5).each do |row|
        (0..3).each do |column|
          won = won || check_upward_diaganol_starting_at(row, column)
          return true if won
        end
      end

      false
    end

    def check_upward_diaganol_starting_at(row, column)
      return false if grid[row][column].value.empty?

      (1..3).each do |col|
        return false if grid[row - col][column + col].value != grid[row][column].value
      end

      true
    end

    def check_downward_diaganols
      won = false
      (0..2).each do |row|
        (0..3).each do |column|
          won = won || check_downward_diaganol_starting_at(row, column)
          return true if won
        end
      end

      false
    end

    def check_downward_diaganol_starting_at(row, column)
      return false if grid[row][column].value.empty?

      (1..3).each do |col|
        return false if grid[row + col][column + col].value != grid[row][column].value
      end

      true
    end
  end
end
