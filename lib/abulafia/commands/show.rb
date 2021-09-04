# frozen_string_literal: true

require 'tty-markdown'

module Abulafia
  module Command
    # The show command. Prints the given note formatted as markdown.
    class Show
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path(args[0])
        raise Abulafia::NoteDoesNotExist, args[0] unless File.exist?(path)

        puts TTY::Markdown.parse_file(path, width: 80)
      end

      def self.command_names
        %w[show s]
      end

      def self.description
        'show note'
      end

      def self.options?
        true
      end

      def self.options
        '[Note name]'
      end

      Abulafia::Commands.register(Abulafia::Command::Show)
    end
  end
end
