# frozen_string_literal: true

module Abulafia
  # Error raised when given command name isn't found.
  class InvalidCommand < RuntimeError
    def message
      'invalid Abulafia command'
    end
  end

  # Error raised if multiple commands are registered with the same name.
  class DuplicateCommandName < RuntimeError
    def initialize(name)
      super
      @name = name
    end

    def message
      "duplicate command registered: #{@name}"
    end
  end

  # Error raised if note name was not provided.
  class MissingFile < RuntimeError
    def message
      'note name required'
    end
  end

  # Error raised if requested note can not be found.
  class NoteDoesNotExist < RuntimeError
    def initialize(name)
      super
      @name = name
    end

    def message
      "unable to find note: #{@name}"
    end
  end
end
