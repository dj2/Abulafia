# frozen_string_literal: true

module Abulafia
  module Command
    # The new command. Creates a new note of the given name.
    class New
      def self.handle(cfg, args)
        raise Abulafia::MissingFile if args.empty?

        name = args.join(' ')
        path = to_slug(name)
        cfg.repo.open(path, 'w') do |f|
          f.puts "# #{name}\n@inbox\n\n"
          f.puts "created_at { #{cfg.time.stamp} }\n\n"
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
                   .downcase
        "#{name}#{ext}"
      end

      Abulafia::Commands.register(Abulafia::Command::New)
    end
  end
end
