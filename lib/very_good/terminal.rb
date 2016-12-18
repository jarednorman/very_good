module VeryGood
  class Terminal
    def initialize
      @state = State.new
    end

    def state
      @state
    end

    def state=(other)
      @state = other
    end

    def update!
    end
  end
end
