module Presenter
  class Action
    class << self
      def ask_for_coordinate(axis:, values:)
        coordinate = nil
        until values.include?(coordinate)
          puts "Entre com a coordenada #{axis}, possiveis valores: " + values.join(', ')
          coordinate = gets.chomp.to_i
        end
        coordinate
      end
    end
  end
end
