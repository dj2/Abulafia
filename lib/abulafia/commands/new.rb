# frozen_string_literal: true

module Abulafia
  module Command
    # The new command. Creates a new note of the given name.
    class New
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        path = to_slug(args[0])
        cfg.repo.open(path, 'w') do |f|
          f.puts "# #{args[0]}\n\n\n"
          f.puts "created_at { #{cfg.time.stamp} }"
        end
        cfg.editor.open(cfg.repo.full_path(path))
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
        ext = File.extname(name)
        name = File.basename(name, ext) unless ext.empty?
        ext = '.md' if ext.empty?

        name = name.gsub(/[^a-zA-Z0-9\-_]/, '-')
                   .gsub(/-+/, '-')
        "#{name}#{ext}"
      end

      Abulafia::Commands.register(Abulafia::Command::New)
    end
  end
end
