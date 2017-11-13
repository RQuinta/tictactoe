module Model
  module Player
    class DummyPlayer
      include BaseIAPlayer

      def choose_move(board:, **_)
        selected_space = board.available_spaces.sample
        Action.new(performer: self, space: selected_space)
      end
    end
  end
end
