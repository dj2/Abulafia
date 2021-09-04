# frozen_string_literal: true

module Abulafia
  module Command
    # The list command. Lists notes.
    class List
      def self.handle(cfg, _args)
        cfg.repo.list.each { |f| cfg.term.puts f }
      end

      def self.command_names
        %w[list ls l]
      end

      def self.description
        'list notes'
      end

      def self.options?
        false
      end

      Abulafia::Commands.register(Abulafia::Command::List)
    end
  end
end
