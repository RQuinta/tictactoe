module Presenter
  class Player
    class << self
      def draw(output:, player:)
        output.puts player.class.name + ' ' + player.marker
      end

      def ask_for_type(input:, output:, options:)
        type = ''
        until options.include? type.to_sym
          output.puts 'Entre com o tipo de jogador: ' + options.map(&:to_s).join(', ')
          type = input.gets.chomp
        end
        type
      end
    end
  end
end
