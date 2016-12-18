module VeryGood
  class Cell
    def initialize(char, colour: nil)
      @char = char
      @colour = colour
    end

    attr_reader :char,
                :colour
  end
end
