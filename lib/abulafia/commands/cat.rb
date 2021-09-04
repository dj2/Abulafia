# frozen_string_literal: true

module Abulafia
  module Command
    # The cat command. Prints the given note without formatting.
    class Cat
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path(args[0])
        raise Abulafia::NoteDoesNotExist, args[0] unless File.exist?(path)

        File.open(path, 'r') do |f|
          puts f.read
        end
      end

      def self.command_names
        %w[cat]
      end

      def self.description
        'cat note'
      end

      def self.options?
        true
      end

      def self.options
        '[Note name]'
      end

      Abulafia::Commands.register(Abulafia::Command::Cat)
    end
  end
end
