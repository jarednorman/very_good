require "very_good/version"
require "very_good/cell"
require "very_good/state"
require "very_good/terminal"
require "very_good/ansi"

module VeryGood
  class << self
    def start
      save_tty
      setup_tty
      terminal = VeryGood::Terminal.new(
        width: command("tput cols").strip.to_i,
        height: command("tput lines").strip.to_i
      )
      terminal.clear!
      terminal.move_cursor(0, 0)
      yield terminal
    ensure
      restore_tty
    end

    private

    def save_tty
      @tty_settings = command("stty -g").strip
    end

    def setup_tty
      command("stty raw -echo -icanon")
    end

    def restore_tty
      command("stty #{@tty_settings}")
    end

    def command(command)
      IO.pipe do |read_io, write_io|
        pid = Process.spawn(command, :in => "/dev/tty", :out => write_io)
        Process.wait(pid)
        raise "Command failed: #{command.inspect}" unless $?.success?
          write_io.close
        read_io.read
      end
    end
  end
end
