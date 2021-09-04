# frozen_string_literal: true

module Abulafia
  # Wrapper around editor for notes.
  class Editor
    def initialize(cmd)
      @cmd = cmd
    end

    def open(path)
      exec("#{@cmd} \"#{path}\"")
    end
  end
end
