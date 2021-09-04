# frozen_string_literal: true

require 'abulafia'
require 'minitest/autorun'
require 'stringio'

module Abulafia
  module Test
    class RepoMock
      def initialize(prefix = '')
        @files = {}
        @prefix = prefix
      end

      def add(name, content)
        @files[name] = StringIO.new(String.new(content), 'a+')
      end

      def list
        @files.keys.sort
      end

      def open(name, _mode)
        yield @files[name]
      end

      def read(name)
        @files[name].string
      end

      def exist?(name)
        @files.key?(name)
      end

      def full_path(name)
        "#{@prefix.empty? ? '' : "#{@prefix}/"}#{name}.md"
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

    class TermMock
      def initialize
        @str = StringIO.new
      end

      def output
        @str.string
      end

      def puts(content)
        @str.puts(content)
      end

      def print(content)
        @str.print(content)
      end
    end

    class TimeMock
      def initialize(time)
        @time = time
      end

      def stamp
        @time.strftime(Abulafia::Time::STAMP_FORMAT)
      end
    end
  end
end
