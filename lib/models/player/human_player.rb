module Model
  module Player
    class HumanPlayer
      attr_reader :marker

      def initialize(marker:, shell:)
        @marker = marker
        @shell = shell
      end

      def choose_move(board:, **_)
        selected_space = @shell.get_coordinates(available_spaces: board.available_spaces)
        Action.new(performer: self, space: selected_space)
      end
    end
  end
end
