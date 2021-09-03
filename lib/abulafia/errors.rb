# frozen_string_literal: true

module Abulafia
  # Error raised when given command name isn't found.
  class InvalidCommand < RuntimeError
  end

  # Error raised if multiple commands are registered with the same name.
  class DuplicateCommandName < RuntimeError
    attr_accessor :name

    def initialize(name)
      super
      self.name = name
    end
  end

  # Error raised if note name was not provided.
  class MissingFile < RuntimeError
  end

  # Error raised if requested note can not be found.
  class NoteDoesNotExist < RuntimeError
    attr_accessor :name

    def initialize(name)
      super
      self.name = name
    end
  end
end
