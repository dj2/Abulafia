# frozen_string_literal: true

module Abulafia
  module Command
    # The search command. Searches notes for the given content. This does not
    # search the note filenames at the moment, under the assumption that the
    # notes are titled the same as the filename. This may need to be adjusted
    # for if that assumption proves faulty.
    class Search
      def self.handle(cfg, args)
        cfg.repo.search(args.join(' ')).each do |result|
          cfg.term.puts "#{result.file}:#{result.line}: #{result.context}"
        end
      end

      def self.command_names
        %w[search s]
      end

      def self.description
        'search notes'
      end

      def self.options?
        true
      end

      def self.options
        '<regex>'
      end

      Abulafia::Commands.register(Abulafia::Command::Search)
    end
  end
end
