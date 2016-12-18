require "very_good/version"
require "very_good/cell"
require "very_good/state"
require "very_good/terminal"

module VeryGood
  COLORS = {
    blue: nil
  }.freeze

  class << self
    def start
      save_tty
      setup_tty
      yield VeryGood::Terminal.new
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
