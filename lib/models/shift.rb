module Model
  class Shift
    attr_reader :current_player
    attr_reader :next_player

    def initialize(players:)
      @current_player = players.first
      @next_player = players.last
    end

    def next
      @current_player, @next_player = @next_player, @current_player
    end
  end
end
