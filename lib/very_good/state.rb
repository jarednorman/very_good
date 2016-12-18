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

    private

    def clean_state
      (0..@width).map do |x|
        [Cell.new(" ")] * @height
      end
    end
  end
end
