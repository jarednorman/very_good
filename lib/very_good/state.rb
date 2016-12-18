module VeryGood
  class State
    def initialize(width:, height:, state: nil, cursor: Cursor.new(0, 0))
      @width = width
      @height = height
      @state = state || clean_state
      @cursor = cursor
    end

    attr_reader :width, :height, :cursor

    def set(x, y, cell)
      new_state = @state.map do |line|
        line.dup
      end

      new_state[y][x] = cell

      State.new(
        width: width,
        height: height,
        state: new_state,
        cursor: cursor
      )
    end

    def set_cursor(new_cursor)
      State.new(
        width: width,
        height: height,
        state: @state,
        cursor: new_cursor
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
