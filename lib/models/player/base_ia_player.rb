module Model
  module Player
    module BaseIAPlayer
      attr_reader :marker

      def initialize(marker:, **_)
        @marker = marker
      end
    end
  end
end
