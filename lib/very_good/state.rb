module VeryGood
  class State
    def initialize(width:, height:, state: nil)
      @width = width
      @height = height
      @state = state || clean_state
    end

    attr_reader :width, :height

    def set(x, y, cell)
    end

    def lines
      @state
    end

    private

    def clean_state
      (0..(@height - 1)).map do |x|
        (0..(@width - 1)).map { |y| Cell.new((y % 10).to_s) }
      end
    end
  end
end
