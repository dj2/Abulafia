# frozen_string_literal: true

require 'abulafia'
require 'minitest/autorun'

module Abulafia
  module Test
    class RepoMock
      def initialize(files, prefix = '')
        @files = files
        @prefix = prefix
      end

      def exist?(name)
        @files.include?(name)
      end

      def full_path(name)
        "#{@prefix.empty? ? '' : "#{@prefix}/"}#{name}"
      end
    end

    class EditorMock
      attr_reader :opened_files

      def initialize
        @opened_files = []
      end

      def open(name)
        @opened_files << name
      end
    end
  end
end
