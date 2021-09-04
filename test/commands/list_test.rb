# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class ListTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.term = Test::TermMock.new
        @cfg.repo = Test::RepoMock.new('path')
      end

      def test_it_lists_notes
        @cfg.repo.add('first file', '')
        @cfg.repo.add('second file', '')

        Abulafia::Command::List.handle(@cfg, [])
        assert !@cfg.term.output.empty?
        assert_equal @cfg.term.output, "first file\nsecond file\n"
      end
    end
  end
end
