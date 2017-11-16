module Presenter
  class Shift
    class << self
      def draw(output:, shift:)
        output.puts 'Jogador do turno: '
        Player.draw(output: output, player: shift.current_player)
      end
    end
  end
end
