# frozen_string_literal: true

module Abulafia
  # Holds configuration data used by the handlers.
  class Config
    attr_accessor :repo, :editor, :term, :time

    def initialize
      @term = $stdout
      @time = Abulafia::Time.new
    end
  end
end
