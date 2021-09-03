require_relative 'errors'

module Abulafia
  class Commands
    @@commands = {}

    def self.register(name, cmd)
      raise Abulafia::DuplicateCommandName.new(name) if @@commands.has_key?(name)
      @@commands[name] = cmd
    end

    def self.commands
      @@commands
    end

    def self.get(name)
      raise Abulafia::InvalidCommand.new unless @@commands.has_key?(name)
      @@commands[name]
    end
  end
end

Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |f| require f }

