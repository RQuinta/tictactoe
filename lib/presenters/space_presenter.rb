module Presenter
  class Space
    class << self

      def draw(output:, space:)
        output.print space.taken? ? '  ' + space.marker + '  ' : '     '
      end
    end
  end
end
