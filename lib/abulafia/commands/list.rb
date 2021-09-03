module Abulafia
  module Command
    class List
      def self.handle(cfg, args)
        cfg.repo.list.each { |f| puts f }
      end

      def self.command_names
        ['list', 'ls', 'l']
      end

      def self.description
        "list notes"
      end

      def self.has_options?
        false
      end

      Abulafia::Commands.register(Abulafia::Command::List)
    end
  end
end

