# frozen_string_literal: true

module Abulafia
  module Command
    # The edit command. Executes editor for the given note file.
    class Edit
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        name = args[0]
        raise Abulafia::NoteDoesNotExist, name unless cfg.repo.exist?(name)

        cfg.editor.open(cfg.repo.full_path(name))
      end

      def self.command_names
        %w[edit e]
      end

      def self.description
        'edit note'
      end

      def self.options?
        true
      end

      def self.options
        '[Note name]'
      end

      Abulafia::Commands.register(Abulafia::Command::Edit)
    end
  end
end
