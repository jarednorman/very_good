module VeryGood
  module Ansi
    BLUE = :blue

    ESC = 27.chr

    class << self
      def escape(sequence)
        ESC + "[" + sequence
      end

      def clear
        escape "2J"
      end

      def move_cursor(x, y)
        escape "#{y};#{x}H"
      end
    end
  end
end
