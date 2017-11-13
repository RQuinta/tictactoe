module Model
  module Player
    module BaseIAPlayer
      include BasePlayer

      def initialize(marker:, **_)
        @marker = marker
      end

      def dummy?
        false
      end
    end
  end
end
