# frozen_string_literal: true

module Abulafia
  module Command
    # The append command. Appends the given text to the note
    class Append
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = args.shift
        raise Abulafia::NoteDoesNotExist, args[0] unless cfg.repo.exist?(path)

        content = args.join(' ')
        return if content.empty?

        cfg.repo.open(path, 'a+') { |f| f.puts content }
      end

      def self.command_names
        %w[append add a]
      end

      def self.description
        'append to note'
      end

      def self.options?
        true
      end

      def self.options
        '[Note name] <content to append>'
      end

      Abulafia::Commands.register(Abulafia::Command::Append)
    end
  end
end
