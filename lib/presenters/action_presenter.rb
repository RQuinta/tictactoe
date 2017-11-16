module Presenter
  class Action
    class << self
      def ask_for_coordinate(input:, output:, axis:, values:)
        coordinate = nil
        until values.include?(coordinate)
          output.puts "Entre com a coordenada #{axis}, possiveis valores: " + values.join(', ')
          coordinate = input.gets.chomp.to_i
        end
        coordinate
      end
    end
  end
end
