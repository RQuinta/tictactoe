module Presenter
  class Board
    class << self
      def draw(output:, board:)
        output.puts '-----------------'
        board.rows.each do |row|
          draw_row(output: output, row: row)
          output.puts '---------------'
        end
      end

      def draw_row(output:, row:)
        output.print '|'
        row.each { |space| Space.draw(output: output, space: space) }
        output.puts '|'
      end
    end
  end
end
