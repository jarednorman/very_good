module VeryGood
  class Terminal
    def initialize(width:, height:)
      @state = State.new(width: width, height: height)
    end

    def state
      @state
    end

    def state=(other)
      @state = other
    end

    def update!
    end

    def clear!
      output.write Ansi.clear
    end

    def move_cursor(x, y)
      output.write Ansi.move_cursor(x, y)
    end

    private

    def output
      STDOUT
    end
  end
end
