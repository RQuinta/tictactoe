module Presenter
  class Match
    class << self
      def welcome(output:)
        output.puts 'TicTacToe'
      end

      def announce_winner(output:, match:)
        output.puts 'O ganhador é '
        Player.draw(output: output, player: match.winner)
      end

      def announce_shift(output:, match:)
        Shift.draw(output: output, shift: match.shift)
      end

      def clear_screen(output:)
        output.puts "\e[2J\e[f"
      end

      def tied(output:)
        output.puts 'Partida empadata'
      end
    end
  end
end
