# frozen_string_literal: true

module Abulafia
  module Command
    # The new command. Creates a new note of the given name.
    class New
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path("#{cfg.time.stamp}-#{to_slug(args[0])}")
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

      def self.to_slug(name)
        name.gsub(/[^a-zA-Z0-9\-\_]/, '-').
             gsub(/-+/, '-')
      end

      Abulafia::Commands.register(Abulafia::Command::New)
    end
  end
end
