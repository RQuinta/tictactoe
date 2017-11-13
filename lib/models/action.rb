module Model
  class Action
    extend Forwardable

    def_delegator :@space, :unchoose, :undo

    def initialize(performer:, space:)
      @performer = performer
      @space = space
    end

    def apply
      @space.choose(player: @performer)
    end

  end
end
