module Presenter
  class Space
    class << self
      def draw_coordinates(coordinate:)
        puts 'Coluna: ' + coordinate[:column] + ' Linha: ' + coordinate[:row]
      end

      def draw(space:)
        print space.taken? ? '  ' + space.marker + '  ' : '     '
      end
    end
  end
end
