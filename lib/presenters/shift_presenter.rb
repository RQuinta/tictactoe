module Presenter
  class Shift
    class << self
      def draw(shift:)
        puts 'Jogador do turno: '
        Player.draw(player: shift.current_player)
      end
    end
  end
end
