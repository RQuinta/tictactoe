module Model
  class Match
    extend Forwardable

    attr_reader :board
    attr_reader :shift

    def_delegator :@shift, :current_player
    def_delegator :@shift, :next_player
    def_delegator :@board, :tied?

    def initialize(players:)
      @players = players
      @board = board || create_board
      @shift = create_shift
    end

    def a_winner?
      !winner.nil?
    end

    def take_turn
      action = current_player.choose_move(board: board, another_player: next_player)
      action.apply
      @shift.next
    end

    def winner
      @players.detect { |player| board.conquered_by?(player: player) }
    end

    private

    def create_board
      Model::Board.new
    end

    def create_shift
      @shift = Model::Shift.new(players: @players)
    end
  end
end
