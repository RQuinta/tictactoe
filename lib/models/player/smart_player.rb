module Model
  module Player
    class SmartPlayer
      include BaseIAPlayer

      def choose_move(board:, another_player:)
        @best_score = {}
        negamax(board: board, another_player: another_player)
        selected_space = @best_score.max_by {|key, value| value}.first
        Action.new(performer: self, space: selected_space)
      end

      def negamax(board:, depth: 0, alpha: -1000, beta: 1000, color: 1, another_player:)
        return 0 if board.tied?
        return color * (1000 / depth) if board.conquered_by?(player: self)
        return color * (-1000 / depth) if board.conquered_by?(player: another_player)
        max = -1000
        board.available_spaces.each do |space|
          player = color.positive? ? self : another_player
          action = Action.new(performer: player, space: space)
          action.apply
          negamax_value = -negamax(board: board, depth: depth+1, beta: -beta, alpha: -alpha, color: -color, another_player: another_player)
          action.undo
          max = [max, negamax_value].max
          @best_score[space] = max if depth == 0
          alpha = [alpha, negamax_value].max
          return alpha if alpha >= beta
        end
        max
      end
    end
  end
end
