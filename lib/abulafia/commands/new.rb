# frozen_string_literal: true

require 'date'
module Abulafia
  module Command
    # The new command. Creates a new note of the given name.
    class New
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path("#{datetime_stamp}-#{to_slug(args[0])}")

        cfg.editor.open(path)
      end

      def self.command_names
        %w[new n]
      end

      def self.description
        'new note'
      end

      def self.options?
        true
      end

      def self.options
        '[Note name]'
      end

      def self.datetime_stamp
        DateTime.now.strftime('%Y%m%d%H%M')
      end

      def self.to_slug(name)
        name.gsub(/[^a-zA-Z0-9\-]/, '-')
      end

      Abulafia::Commands.register(Abulafia::Command::New)
    end
  end
end
