module Presenter
  class Player
    class << self
      def draw(player:)
        puts player.class.name + ' ' + player.marker
      end

      def ask_for_type(options:)
        type = ''
        until options.include? type.to_sym
          puts 'Entre com o tipo de jogador: ' + options.map(&:to_s).join(', ')
          type = gets.chomp
        end
        type
      end
    end
  end
end
