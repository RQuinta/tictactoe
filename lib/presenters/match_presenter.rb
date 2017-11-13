module Presenter
  class Match
    class << self
      def welcome
        puts 'TicTacToe'
      end

      def draw
      end

      def announce_winner(match:)
        puts 'O ganhador é '
        Player.draw(player: match.winner)
      end

      def announce_shift(match:)
        Shift.draw(shift: match.shift)
      end

      def clear_screen
        puts "\e[2J\e[f"
      end

      def tied
        puts 'Partida empadata'
      end
    end
  end
end
