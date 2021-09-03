module Abulafia
  class InvalidCommand < RuntimeError
  end

  class DuplicateCommandName < RuntimeError
    attr_accessor :name
    def initialize(name)
      self.name = name
    end
  end

  class MissingFile < RuntimeError
  end

  class FilesDoesNotExist < RuntimeError
    attr_accessor :name
    def initialize(name)
      self.name = name
    end
  end
end

