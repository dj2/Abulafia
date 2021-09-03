module Abulafia
  module Command
    class Help
      def self.handle(cfg, args)
        cmds = Abulafia::Commands.commands

        puts "abulafia [COMMAND] [OPTIONS] [ARGS]\n\n"
        puts "COMMANDS"
        keys = cmds.keys.sort

        longest = 0
        keys.each do |k|
          longest = k.length if k.length > longest
        end
        longest += 3

        keys.each do |k|
          puts "  #{k}#{" " * (longest - k.length)}-- #{cmds[k].description}"
          puts cmds[k].options if cmds[k].has_options?
        end
      end

      def self.description
        "this help content"
      end

      def self.has_options?
        false
      end

      Abulafia::Commands.register('help', Abulafia::Command::Help)
    end
  end
end
