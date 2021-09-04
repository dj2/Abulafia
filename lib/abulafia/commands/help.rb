# frozen_string_literal: true

module Abulafia
  module Command
    # The help command. Prints help information.
    class Help
      def self.handle(cfg, _args)
        cfg.term.puts "abulafia [COMMAND] [OPTIONS] [ARGS]\n\nCOMMANDS"
        build_command_info.each do |k|
          cmd = k[:cmd]
          names = k[:names].join(', ')
          desc = cmd.description

          opts = cmd.options? ? " #{cmd.options}" : ''
          cfg.term.puts "  #{names}#{opts} -- #{desc}"
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
