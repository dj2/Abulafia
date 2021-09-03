module Abulafia
  module Command
    class Help
      def self.handle(cfg, args)
        cmds = Abulafia::Commands.handlers

        puts "abulafia [COMMAND] [OPTIONS] [ARGS]\n\n"
        puts "COMMANDS"
        keys = cmds.collect { |c|
          names = Array.new(c.send(:command_names))
          {
            names: names,
            cmd: c
          }
        }.sort { |a, b| a[:names].first <=> b[:names].first }

        keys.each do |k|
          print "  #{k[:names].join(', ')}"
          print " #{k[:cmd].options}" if k[:cmd].has_options?
          print " -- #{k[:cmd].description}\n"
        end
      end

      def self.command_names
        ['help', 'h']
      end

      def self.description
        "this help content"
      end

      def self.has_options?
        false
      end

      Abulafia::Commands.register(Abulafia::Command::Help)
    end
  end
end
