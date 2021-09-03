module Abulafia
  module Command
    class Edit
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path(args[0])
        raise Abulafia::NoteDoesNotExist.new(args[0]) unless File.exist?(path)

        exec("#{cfg.editor} \"#{path}\"")
      end

      def self.description
        "edit note"
      end

      def self.has_options?
        true
      end

      def self.options
        puts "   [Note name]"
      end

      Abulafia::Commands.register('edit', Abulafia::Command::Edit)
    end
  end
end

