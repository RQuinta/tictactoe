module Model
  class Board
    extend Forwardable

    TOTAL_SPACES = 3

    def_delegator :@matrix, :to_a, :rows

    def initialize
      set_initial_state
    end

    def set_initial_state
      @matrix = Matrix.build(TOTAL_SPACES) { |row, column| Space.new(row: row, column: column) }
    end

    def available_spaces
      spaces.select(&:available?)
    end

    def conquered_by?(player:)
      structures.any? do |structure|
        structure.any? do |row|
          row.all? { |space| space.owned_by?(player: player) }
        end
      end
    end

    def tied?
      structures.all? do |structure|
        structure.all? do |row|
          row.map(&:marker).compact.uniq.size > 1
        end
      end
    end

    def columns
      @matrix.column_vectors.map(&:to_a)
    end

    private

    def diagonals
      @diagonals = [primary_diagonal, secondary_diagonal]
    end

    def primary_diagonal
      @primary_diagonal = spaces.select(&:diagonal?)
    end

    def secondary_diagonal
      @secondary_diagonal = spaces.select(&:secondary_diagonal?)
    end

    def structures
      @structures = [rows, columns, diagonals]
    end

    def spaces
      @spaces = rows.flatten
    end
  end
end
