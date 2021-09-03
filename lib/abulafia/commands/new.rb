require 'date'
module Abulafia
  module Command
    class New
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = cfg.repo.full_path("#{self.datetime_stamp}-#{self.to_slug(args[0])}")

        exec("#{cfg.editor} \"#{path}\"")
      end

      def self.command_names
        ['new', 'n']
      end

      def self.description
        "new note"
      end

      def self.has_options?
        true
      end

      def self.options
        "[Note name]"
      end

      def self.datetime_stamp
        DateTime.now.strftime("%Y%m%d%H%M")
      end

      def self.to_slug(name)
        name.gsub(/[^a-zA-Z0-9\-]/, '-')
      end

      Abulafia::Commands.register(Abulafia::Command::New)
    end
  end
end

