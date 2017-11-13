module Model
  class Space
    attr_reader :row, :column

    def initialize(row:, column:)
      @row = row
      @column = column
    end

    def marker
      @player ? @player.marker : nil
    end

    def diagonal?
      @row == @column
    end

    def secondary_diagonal?
      @row + @column == Board::TOTAL_SPACES - 1
    end

    def owned_by?(player:)
      @player == player
    end

    def choose(player:)
      @player = player unless taken?
    end

    def unchoose
      @player = nil unless available?
    end

    def available?
      @player.nil?
    end

    def taken?
      !available?
    end
  end
end
