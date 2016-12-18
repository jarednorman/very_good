require "very_good/version"
require "very_good/cell"
require "very_good/state"

module VeryGood
  COLORS = {
    blue: nil
  }.freeze

  class << self
    def start!
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
