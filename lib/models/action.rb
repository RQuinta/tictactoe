module Model
  class Action
    extend Forwardable

    def_delegator :@space, :unchoose, :undo
    attr_reader :performer, :space

    def initialize(performer:, space:)
      @performer = performer
      @space = space
    end

    def apply
      @space.choose(player: @performer)
    end

  end
end
