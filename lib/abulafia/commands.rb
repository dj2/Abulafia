require_relative 'errors'

module Abulafia
  class Commands
    @@commands = {}
    @@handlers = []

    def self.register(cmd)
      names = Array.new(cmd.send(:command_names))
      names.each do |n|
        raise Abulafia::DuplicateCommandName.new(n) if @@commands.has_key?(n)
        @@commands[n] = cmd
      end
      @@handlers << cmd
    end

    def self.handlers
      @@handlers
    end

    def self.get(name)
      raise Abulafia::InvalidCommand.new unless @@commands.has_key?(name)
      @@commands[name]
    end
  end
end

Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |f| require f }

