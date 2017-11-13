module Presenter
  class Board
    class << self
      def draw(board:)
        puts '-----------------'
        board.rows.each do |row|
          draw_row(row: row)
          puts '---------------'
        end
      end

      def draw_row(row:)
        print '|'
        row.each { |space| Space.draw(space: space) }
        puts '|'
      end
    end
  end
end
