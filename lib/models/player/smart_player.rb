module Model
  module Player
    class SmartPlayer
      include BaseIAPlayer

      attr_reader :marker

      def choose_move(board:, actual_player:, another_player:)
        best_space = board.available_spaces.max_by do |space|
          move = Action.new(performer: self, space: space)
          move.apply
          rank_value = -1 * best_move(board: board, actual_player: another_player, another_player:   actual_player )
          move.undo
          rank_value
        end
        Action.new(performer: self, space: best_space)
      end

      private

      def best_move(board:, actual_player: nil, another_player:, depth: 0)
        if board.tied?
          0
        elsif board.conquered_by?(player: self)
          10 - depth
        elsif board.conquered_by?(player: another_player)
          -10
        else
          better_move = nil
          board.available_spaces.each do |space|
            move = Action.new(performer: self, space: space)
            move.apply
            result = best_move(board: board, another_player: another_player, depth: depth + 1)
            move.undo
            better_move = result if better_move.nil? || result > better_move
          end
          better_move
        end
      end
    end
  end
end
