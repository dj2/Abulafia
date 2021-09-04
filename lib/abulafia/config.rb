# frozen_string_literal: true

module Abulafia
  class Config
    attr_accessor :repo, :editor, :term, :time

    def initialize
      @term = STDOUT
      @time = Abulafia::Time.new
    end
  end
end
