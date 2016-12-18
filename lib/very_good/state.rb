module VeryGood
  class State
    def initialize(width:, height:, state: nil)
      @width = width
      @height = height
      @state = state || clean_state
    end

    attr_reader :width, :height

    def set(x, y, cell)
      new_state = @state.map do |line|
        line.dup
      end

      new_state[y][x] = cell

      State.new(
        width: width,
        height: height,
        state: new_state
      )
    end

    def lines
      @state
    end

    private

    def clean_state
      (0..(@height - 1)).map do |x|
        (0..(@width - 1)).map { Cell.new(' ') }
      end
    end
  end
end
