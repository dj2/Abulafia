# frozen_string_literal: true

module Abulafia
  module Command
    # The help command. Prints help information.
    class Help
      def self.handle(_cfg, _args)
        puts "abulafia [COMMAND] [OPTIONS] [ARGS]\n\n"
        puts 'COMMANDS'
        build_command_info.each do |k|
          print "  #{k[:names].join(', ')}"
          print " #{k[:cmd].options}" if k[:cmd].options?
          print " -- #{k[:cmd].description}\n"
        end
      end

      def self.command_names
        %w[help h]
      end

      def self.description
        'this help content'
      end

      def self.options?
        false
      end

      def self.build_command_info
        cmds = Abulafia::Commands.handlers
        keys = cmds.collect do |c|
          names = Array.new(c.send(:command_names))
          {
            names: names,
            cmd: c
          }
        end
        keys.sort { |a, b| a[:names].first <=> b[:names].first }
      end

      Abulafia::Commands.register(Abulafia::Command::Help)
    end
  end
end
