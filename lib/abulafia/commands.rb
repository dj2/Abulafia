# frozen_string_literal: true

require_relative 'errors'

module Abulafia
  # The command class. Holds the set of commands available to be executed
  # and maps command names to the command.
  class Commands
    @commands = {}
    @handlers = []

    class << self
      attr_reader :handlers

      def register(cmd)
        names = Array.new(cmd.send(:command_names))
        names.each do |n|
          raise Abulafia::DuplicateCommandName, n if @commands.key?(n)

          @commands[n] = cmd
        end
        @handlers << cmd
      end

      def get(name)
        raise Abulafia::InvalidCommand unless @commands.key?(name)

        @commands[name]
      end
    end
  end
end

Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |f| require f }
